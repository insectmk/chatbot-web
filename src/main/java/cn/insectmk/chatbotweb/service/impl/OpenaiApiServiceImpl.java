package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.configure.SseEmitterUTF8;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import com.plexpt.chatgpt.ChatGPT;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.ChatCompletionResponse;
import com.plexpt.chatgpt.entity.chat.Message;
import com.plexpt.chatgpt.listener.SseStreamListener;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import java.util.Arrays;

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

    @Override
    public String send(ChatMessage chatMessage) {
        Message message = Message.of(chatMessage.getMessageContent());
        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model("llama2")
                .messages(Arrays.asList(message))
                .stream(false)
                .temperature(1)
                .topP(1)
                .presencePenalty(0)
                .frequencyPenalty(0)
                .maxTokens(250)
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
