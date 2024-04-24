package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.listener.GPTEventSourceListener;
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
import cn.insectmk.chatbotweb.util.URLUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.plexpt.chatgpt.ChatGPT;
import com.plexpt.chatgpt.ChatGPTStream;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.ChatCompletionResponse;
import com.plexpt.chatgpt.entity.chat.Message;
import com.unfbx.chatgpt.utils.TikTokensUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import java.util.List;

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
    private ModelVersionMapper modelVersionMapper;
    @Autowired
    private ChatSessionMapper chatSessionMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private URLUtil urlUtil;

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
        // 查看模型在线状态
        if (!urlUtil.isUrlOnline(modelVersion.getApiHost() + "/status")) {
            // 不在线就抛出异常
            throw new BizException("模型不在线");
        }
        // 进行对话
        // 设置监听器
        GPTEventSourceListener listener = new GPTEventSourceListener(sseEmitter);
        // 装载历史对话
        List<Message> messages = chatSessionMapper.selectHistoryMsg(chatMessage.getSessionId());
        // 中文引导（紧急处理方案）
        //messages.add(Message.ofSystem("你是一个智能聊天机器人，你需要回答用户的所有问题"));
        // 装载新对话
        messages.add(Message.of(chatMessage.getMessageContent()));

        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model(ChatCompletion.Model.GPT_3_5_TURBO.getName())
                .messages(messages)
                .stream(true)
                .temperature(modelVersion.getTemperature())
                .topP(modelVersion.getTopP())
                .presencePenalty(modelVersion.getPresencePenalty())
                .frequencyPenalty(modelVersion.getFrequencyPenalty())
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
            //sseEmitter.complete(); // 结束流
            // 计算token值
            int completionTokens = TikTokensUtil.tokens(chatCompletion.getModel(), msg); //机器人生成token

            // 存储用户新对话
            ChatMessage userChatMessage = new ChatMessage();
            userChatMessage.setSessionId(chatSession.getId());
            userChatMessage.setSenderType(ChatMessage.SENDER_TYPE_USER);
            userChatMessage.setMessageContent(chatMessage.getMessageContent());
            // 扩展字段
            userChatMessage.setWordCount((long) chatMessage.getMessageContent().length());
            baseMapper.insert(userChatMessage);
            // 存储机器人新对话
            ChatMessage botChatMessage = new ChatMessage();
            botChatMessage.setSessionId(chatSession.getId());
            botChatMessage.setSenderType(ChatMessage.SENDER_TYPE_ASSISTANT);
            botChatMessage.setMessageId(userChatMessage.getId());
            botChatMessage.setMessageContent(msg);
            // 扩展字段
            botChatMessage.setWordCount((long) msg.length());
            botChatMessage.setTokens((long) completionTokens);
            botChatMessage.setModelVersionId(modelVersion.getId());
            botChatMessage.setModelVersionName(modelVersion.getName());
            baseMapper.insert(botChatMessage);
            chatSessionService.updateById(chatSession);

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
        // 查询用户
        User user = userMapper.selectById(chatSession.getUserId());
        // 如果没有Tokens存量了就结束
        if (user.getTokens() <= 0L) {
            throw new BizException("Tokens存量不足");
        }
        // 查看模型在线状态
        if (!urlUtil.isUrlOnline(modelVersion.getApiHost() + "/status")) {
            // 不在线就抛出异常
            throw new BizException("模型不在线");
        }
        // 装载历史对话
        List<Message> messages = chatSessionMapper.selectHistoryMsg(chatMessage.getSessionId());
        // 中文引导（紧急处理方案）
        //messages.add(Message.ofSystem("你是一个智能聊天机器人，你需要回答用户的所有问题"));
        // 装载新对话
        messages.add(Message.of(chatMessage.getMessageContent()));

        // 存储用户新对话
        ChatMessage userChatMessage = new ChatMessage();
        userChatMessage.setSessionId(chatSession.getId());
        userChatMessage.setSenderType(ChatMessage.SENDER_TYPE_USER);
        userChatMessage.setMessageContent(chatMessage.getMessageContent());
        // 扩展字段
        userChatMessage.setWordCount((long) chatMessage.getMessageContent().length());
        baseMapper.insert(userChatMessage);

        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model(ChatCompletion.Model.GPT_3_5_TURBO.getName())
                .messages(messages)
                .stream(false)
                .temperature(modelVersion.getTemperature())
                .topP(modelVersion.getTopP())
                .presencePenalty(modelVersion.getPresencePenalty())
                .frequencyPenalty(modelVersion.getFrequencyPenalty())
                .maxTokens(modelVersion.getMaxToken())
                .build();

        ChatGPT chatGPT = ChatGPT.builder()
                .timeout(600)
                .apiHost(modelVersion.getApiHost())
                .apiKey(modelVersion.getApiKey())
                .build()
                .init();
        // 得到响应
        ChatCompletionResponse chatCompletionResponse = chatGPT.chatCompletion(chatCompletion);

        // 减去用户的Tokens存量
        long completionTokens = chatCompletionResponse.getUsage().getCompletionTokens();
        user.setTokens(user.getTokens() - completionTokens);
        userMapper.updateById(user);
        // 增加模型的生成Tokens量
        modelVersion.setGenerateTokens(modelVersion.getGenerateTokens() + completionTokens);
        modelVersionMapper.updateById(modelVersion);
        // 返回处理的消息
        String response = chatCompletionResponse.getChoices().get(0).getMessage().getContent();

        // 存储机器人新对话
        ChatMessage botChatMessage = new ChatMessage();
        botChatMessage.setSessionId(chatSession.getId());
        botChatMessage.setSenderType(ChatMessage.SENDER_TYPE_ASSISTANT);
        botChatMessage.setMessageId(userChatMessage.getId());
        botChatMessage.setMessageContent(response);
        // 扩展字段
        botChatMessage.setWordCount((long) response.length());
        botChatMessage.setTokens(completionTokens);
        botChatMessage.setModelVersionId(modelVersion.getId());
        botChatMessage.setModelVersionName(modelVersion.getName());
        baseMapper.insert(botChatMessage);

        return response;
    }
}
