package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.extension.service.IService;
import com.plexpt.chatgpt.entity.chat.Message;

import java.util.List;

/**
 * @Description 会话服务接口
 * @Author makun
 * @Date 2024/2/26 15:48
 * @Version 1.0
 */
public interface ChatSessionService extends IService<ChatSession> {
    /**
     * 获取对话的历史消息
     * @param sessionId
     * @return
     */
    List<Message> getHistoryMsg(String sessionId);

    /**
     * 删除会话
     * @param sessionId
     * @return
     */
    boolean deleteById(String sessionId);

    /**
     * 获取用户所有的聊天
     * @param userId
     * @return
     */
    List<ChatSession> getAllChatSession(String userId);
}
