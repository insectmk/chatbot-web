package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.plexpt.chatgpt.entity.chat.Message;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class ChatSessionMapperTest {
    @Autowired
    private ChatSessionMapper chatSessionMapper;

    @Test
    void selectOne() {
        ChatSession chatSession = chatSessionMapper.selectOne(new QueryWrapper<ChatSession>().last("LIMIT 1"));
        System.out.println(chatSession);
    }

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
        List<Message> messages = chatSessionMapper.selectHistoryMsg("1");
        System.out.println(messages);
    }
}
