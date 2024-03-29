package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.service.ChatSessionService;
import com.plexpt.chatgpt.entity.chat.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@SpringBootTest
class ChatSessionServiceImplTest {
    @Autowired
    private ChatSessionService chatSessionService;

    @Test
    void getHistoryMessageBySessionId() {
        List<Message> historyMsg = chatSessionService.getHistoryMsg("0c2c9ffead3b018e0ba16a711d1885e4");

        for (Message message : historyMsg) {
            System.out.println(message);
        }
    }
}
