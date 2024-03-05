package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.common.Dialog;
import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;

@SpringBootTest
class ChatSessionMapperTest {
    @Autowired
    private ChatSessionMapper chatSessionMapper;

    @Test
    void selectHistoryMsg() {
        chatSessionMapper.selectHistoryMsg(null);
    }

    @Test
    void findOne() {
        ChatSession chatSession = chatSessionMapper.selectOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, "ef44eec4f77a3082e32324ca5f9b3737"));
        System.out.println(chatSession);
    }

    @Test
    void selectHistoryMessageBySessionId() {
        ArrayList<Dialog> strings = chatSessionMapper.selectHistoryMessageBySessionId("1");
        System.out.println(strings);
    }
}
