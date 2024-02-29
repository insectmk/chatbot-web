package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.extension.service.IService;
import java.util.List;

/**
 * @Description 会话服务接口
 * @Author makun
 * @Date 2024/2/26 15:48
 * @Version 1.0
 */
public interface ChatSessionService extends IService<ChatSession> {
    /**
     * 获取用户所有的聊天
     * @param userId
     * @return
     */
    List<ChatSession> getAllChatSession(String userId);

    /**
     * 获取历史的对话
     * @param sessionId
     * @return
     */
    List<String[]> getHistoryMessageBySessionId(String sessionId);
}
