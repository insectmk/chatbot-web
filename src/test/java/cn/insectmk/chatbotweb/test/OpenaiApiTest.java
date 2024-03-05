package cn.insectmk.chatbotweb.test;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.service.OpenaiApiService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

/**
 * @Description OpenAI接口测试
 * @Author makun
 * @Date 2024/3/5 10:03
 * @Version 1.0
 */
@SpringBootTest
public class OpenaiApiTest {
    @Autowired
    private OpenaiApiService openaiApiService;

    @Test
    void sendTest() {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setMessageContent("你好");
        String response = openaiApiService.send(chatMessage);
        System.out.println(response);
    }
}
