package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatMessageMapper;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.plexpt.chatgpt.ChatGPTStream;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.Message;
import com.plexpt.chatgpt.listener.SseStreamListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
    @Value("${openai.api-host}")
    private String apiHost;
    @Value("${openai.api-key}")
    private String apiKey;
    @Value("${openai.max-token}")
    private Integer maxToken;

    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private OpenaiApiService openaiApiService;

    @Override
    public void sendStream(ChatMessage chatMessage, SseEmitter sseEmitter) {
        // 判断当前会话是否在生成
        ChatSession chatSession = chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, chatMessage.getSessionId()));
        /*if (chatSession.getStatus().equals(ChatSession.STATUS_BUSY)) {
            throw new BizException("当前会话正忙");
        }
        // 更换状态
        chatSession.setStatus(ChatSession.STATUS_BUSY);
        chatSessionService.updateById(chatSession);*/
        // 进行对话
        // 设置监听器
        SseStreamListener listener = new SseStreamListener(sseEmitter);

        Message message = Message.of(chatMessage.getMessageContent());
        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model("llama2")
                .messages(Arrays.asList(message))
                .stream(true)
                .temperature(1)
                .topP(1)
                .presencePenalty(0)
                .frequencyPenalty(0)
                .maxTokens(maxToken)
                .build();

        ChatGPTStream chatGPTStream = ChatGPTStream.builder()
                .timeout(600)
                .apiHost(apiHost)
                .apiKey(apiKey)
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
            // 更新对话状态
            chatSession.setStatus(ChatSession.STATUS_FREE);
            chatSessionService.updateById(chatSession);
        });
    }

    @Override
    public String send(ChatMessage chatMessage) {
        // 判断当前会话是否在生成
        ChatSession chatSession = chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, chatMessage.getSessionId()));
        /*if (chatSession.getStatus().equals(ChatSession.STATUS_BUSY)) {
            throw new BizException("当前会话正忙");
        }
        // 更换状态
        chatSession.setStatus(ChatSession.STATUS_BUSY);
        chatSessionService.updateById(chatSession);*/
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
        // 更新对话状态
        chatSession.setStatus(ChatSession.STATUS_FREE);
        chatSessionService.updateById(chatSession);

        return response;
    }
}
