package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import com.plexpt.chatgpt.ChatGPT;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.ChatCompletionResponse;
import com.plexpt.chatgpt.entity.chat.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * @Description OpenAI式API服务接口实现类
 * @Author makun
 * @Date 2024/3/5 10:59
 * @Version 1.0
 */
@Service
public class OpenaiApiServiceImpl implements OpenaiApiService {
    @Value("${openai.api-host}")
    private String apiHost;
    @Value("${openai.api-key}")
    private String apiKey;
    @Value("${openai.max-token}")
    private Integer maxToken;

    @Autowired
    private ChatSessionMapper chatSessionMapper;

    @Override
    public String send(ChatMessage chatMessage) {
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
                .maxTokens(maxToken)
                .build();

        ChatGPT chatGPT = ChatGPT.builder()
                .timeout(600)
                .apiHost(apiHost)
                .apiKey(apiKey)
                .build()
                .init();

        ChatCompletionResponse chatCompletionResponse = chatGPT.chatCompletion(chatCompletion);

        return chatCompletionResponse.getChoices().get(0).getMessage().getContent();
    }
}
