package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChatMessageServiceImplTest {
    @Autowired
    private ChatMessageService chatMessageService;

    @Test
    void send() {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setSessionId("54989a5dd273cdd73e0e6e5972b954be");
        chatMessage.setMessageContent("你好");

        System.out.println(chatMessageService.send(chatMessage));
    }
}
