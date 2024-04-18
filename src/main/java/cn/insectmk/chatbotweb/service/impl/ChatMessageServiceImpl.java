package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatMessageMapper;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.plexpt.chatgpt.ChatGPTStream;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.Message;
import com.plexpt.chatgpt.listener.SseStreamListener;
import com.unfbx.chatgpt.utils.TikTokensUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import java.util.Arrays;

/**
 * @Description 聊天消息服务接口实现
 * @Author makun
 * @Date 2024/2/26 15:52
 * @Version 1.0
 */
@Service
@Transactional
public class ChatMessageServiceImpl extends ServiceImpl<ChatMessageMapper, ChatMessage> implements ChatMessageService {
    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private OpenaiApiService openaiApiService;
    @Autowired
    private ModelVersionMapper modelVersionMapper;
    @Autowired
    private ChatSessionMapper chatSessionMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public void sendStream(ChatMessage chatMessage, SseEmitter sseEmitter) {
        // 查询会话
        ChatSession chatSession = chatSessionMapper.selectById(chatMessage.getSessionId());
        // 查询用户信息
        User user = userMapper.selectById(chatSession.getUserId());
        // 如果没有Tokens存量了就结束
        if (user.getTokens() <= 0L) {
            throw new BizException("Tokens存量不足");
        }
        // 查询模型信息
        ModelVersion modelVersion = modelVersionMapper.selectById(chatSession.getModelVersionId());

        // 进行对话
        // 设置监听器
        SseStreamListener listener = new SseStreamListener(sseEmitter);

        Message message = Message.of(chatMessage.getMessageContent());
        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model(ChatCompletion.Model.GPT_3_5_TURBO.getName())
                .messages(Arrays.asList(message))
                .stream(true)
                .temperature(1)
                .topP(1)
                .presencePenalty(0)
                .frequencyPenalty(0)
                .maxTokens(modelVersion.getMaxToken())
                .build();

        ChatGPTStream chatGPTStream = ChatGPTStream.builder()
                .timeout(600)
                .apiHost(modelVersion.getApiHost())
                .apiKey(modelVersion.getApiKey())
                .build()
                .init();

        chatGPTStream.streamChatCompletion(chatCompletion, listener);
        //回答完成，可以做一些事情
        listener.setOnComplate((msg) -> {
            sseEmitter.complete(); // 结束流

            // 存储用户新对话
            ChatMessage userChatMessage = new ChatMessage(null, chatSession.getId(),
                    ChatMessage.SENDER_TYPE_USER, null,
                    chatMessage.getMessageContent(),
                    null);
            baseMapper.insert(userChatMessage);
            // 存储机器人新对话
            ChatMessage botChatMessage = new ChatMessage(null, chatSession.getId(),
                    ChatMessage.SENDER_TYPE_ASSISTANT,
                    userChatMessage.getId(),
                    msg,
                    null);
            baseMapper.insert(botChatMessage);
            chatSessionService.updateById(chatSession);

            // 计算token值
            int completionTokens = TikTokensUtil.tokens(chatCompletion.getModel(), msg);
            // 减去用户的Tokens存量
            user.setTokens(user.getTokens() - completionTokens);
            userMapper.updateById(user);
            // 增加模型的生成Tokens量
            modelVersion.setGenerateTokens(modelVersion.getGenerateTokens() + completionTokens);
            modelVersionMapper.updateById(modelVersion);
        });
    }

    @Override
    public String send(ChatMessage chatMessage) {
        // 查询模型信息
        ChatSession chatSession = chatSessionMapper.selectById(chatMessage.getSessionId());
        ModelVersion modelVersion = modelVersionMapper.selectById(chatSession.getModelVersionId());
        // 进行对话
        String response = openaiApiService.send(chatMessage);
        // 存储用户新对话
        ChatMessage userChatMessage = new ChatMessage(null, chatSession.getId(),
                ChatMessage.SENDER_TYPE_USER, null,
                chatMessage.getMessageContent(),
                null);
        baseMapper.insert(userChatMessage);
        // 存储机器人新对话
        ChatMessage botChatMessage = new ChatMessage(null, chatSession.getId(),
                ChatMessage.SENDER_TYPE_ASSISTANT,
                userChatMessage.getId(),
                response,
                null);
        baseMapper.insert(botChatMessage);

        return response;
    }
}
