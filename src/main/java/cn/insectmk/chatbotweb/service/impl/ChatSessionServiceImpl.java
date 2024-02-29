package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.Dialog;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * @Description 会话服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:00
 * @Version 1.0
 */
@Service
@Transactional
public class ChatSessionServiceImpl extends ServiceImpl<ChatSessionMapper, ChatSession> implements ChatSessionService {
    @Override
    public List<ChatSession> getAllChatSession(String userId) {
        return baseMapper.selectList(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getUserId, userId)
                .orderByDesc(ChatSession::getEndTime));
    }

    @Override
    public List<String[]> getHistoryMessageBySessionId(String sessionId) {
        // 查询历史对话
        ArrayList<Dialog> dialogs = baseMapper.selectHistoryMessageBySessionId(sessionId);

        // 将对象集合转为数组集合
        ArrayList<String[]> dialogsArray = new ArrayList<>(dialogs.size());

        for (Dialog dialog : dialogs) {
            String[] arr = new String[2];
            arr[0] = dialog.getUserMessage();
            arr[1] = dialog.getBotMessage();
            dialogsArray.add(arr);
        }

        return dialogsArray;
    }
}
