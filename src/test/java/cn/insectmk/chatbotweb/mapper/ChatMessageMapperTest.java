package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChatMessageMapperTest {
    @Autowired
    private ChatMessageMapper chatMessageMapper;

    @Test
    void insectOne() {
        ChatMessage chatMessage = new ChatMessage(null,"0c2c9ffead3b018e0ba16a711d1885e4",
                ChatMessage.SENDER_TYPE_USER, null,
                "机器人(String), 你好\uD83D\uDC4B！我是人工智能助手 ChatGLM2-6B，很高兴见到你，欢迎问我任何问题。",
                null);

        chatMessageMapper.insert(chatMessage);
    }
}
