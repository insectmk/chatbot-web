package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.service.ChatSessionService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.Arrays;

@SpringBootTest
class ChatSessionServiceImplTest {
    @Autowired
    private ChatSessionService chatSessionService;

    @Test
    void getHistoryMessageBySessionId() {
        ArrayList<String[]> dialogs = chatSessionService.getHistoryMessageBySessionId("0c2c9ffead3b018e0ba16a711d1885e4");
        for (String[] dialog : dialogs) {
            System.out.println(Arrays.toString(dialog));
        }
    }
}
