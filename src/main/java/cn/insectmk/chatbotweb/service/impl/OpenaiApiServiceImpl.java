package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import com.plexpt.chatgpt.ChatGPT;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.ChatCompletionResponse;
import com.plexpt.chatgpt.entity.chat.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description OpenAI式API服务接口实现类
 * @Author makun
 * @Date 2024/3/5 10:59
 * @Version 1.0
 */
@Service
@Transactional
public class OpenaiApiServiceImpl implements OpenaiApiService {
    @Autowired
    private ModelVersionMapper modelVersionMapper;
    @Autowired
    private ChatSessionMapper chatSessionMapper;
    @Autowired
    private UserMapper userMapper;

    @Override
    public String send(ChatMessage chatMessage) {
        // 查询会话
        ChatSession chatSession = chatSessionMapper.selectById(chatMessage.getSessionId());
        // 查询用户
        User user = userMapper.selectById(chatSession.getUserId());
        // 如果没有Tokens存量了就结束
        if (user.getTokens() <= 0L) {
            throw new BizException("Tokens存量不足");
        }
        // 查询模型信息
        ModelVersion modelVersion = modelVersionMapper.selectById(chatSession.getModelVersionId());
        // 装载历史对话
        List<Message> messages = chatSessionMapper.selectHistoryMsg(chatMessage.getSessionId());
        // 装载新对话
        messages.add(Message.of(chatMessage.getMessageContent()));

        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model("llama2")
                .messages(messages)
                .stream(false)
                .temperature(1)
                .topP(1)
                .presencePenalty(0)
                .frequencyPenalty(0)
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
        long totalTokens = chatCompletionResponse.getUsage().getTotalTokens();
        user.setTokens(user.getTokens() - totalTokens);
        userMapper.updateById(user);
        // 返回处理的消息
        return chatCompletionResponse.getChoices().get(0).getMessage().getContent();
    }
}
