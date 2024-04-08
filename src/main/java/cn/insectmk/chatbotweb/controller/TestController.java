package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.configure.SseEmitterUTF8;
import com.plexpt.chatgpt.ChatGPTStream;
import com.plexpt.chatgpt.entity.chat.ChatCompletion;
import com.plexpt.chatgpt.entity.chat.Message;
import com.plexpt.chatgpt.listener.SseStreamListener;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import javax.annotation.security.PermitAll;
import java.util.Arrays;

/**
 * @Description 测试接口
 * @Author makun
 * @Date 2024/3/5 10:07
 * @Version 1.0
 */
@RestController
@RequestMapping("/pri/test")
public class TestController {
    private static final String OPENAI_API_HOST = "http://127.0.0.1:8000/";

    @GetMapping("/hello")
    public Result helloWorld() {
        return Result.buildSuccess("你好", null);
    }

    @GetMapping(value = "/v1/stream")
    @PermitAll
    public SseEmitter streamEvents(@RequestParam String query) {
        SseEmitterUTF8 sseEmitter = new SseEmitterUTF8(-1L);

        SseStreamListener listener = new SseStreamListener(sseEmitter);
        //ConsoleStreamListener listener = new ConsoleStreamListener();
        Message message = Message.of(query);
        ChatCompletion chatCompletion = ChatCompletion.builder()
                .model("llama2")
                .messages(Arrays.asList(message))
                .stream(true)
                .temperature(1)
                .topP(1)
                .presencePenalty(0)
                .frequencyPenalty(0)
                .maxTokens(250)
                .build();

        // 不需要代理的话，注销此行
        //Proxy proxy = Proxys.http("192.168.1.98", 7890);
        ChatGPTStream chatGPTStream = ChatGPTStream.builder()
                .timeout(600)
                .apiKey("empty")
                //.proxy(proxy)
                .apiHost(OPENAI_API_HOST)
                .build()
                .init();

        chatGPTStream.streamChatCompletion(chatCompletion, listener);
        listener.setOnComplate(msg -> {
            //回答完成，可以做一些事情
            //sseEmitter.complete();
            System.out.println(msg);
        });
        return sseEmitter;
    }
}
