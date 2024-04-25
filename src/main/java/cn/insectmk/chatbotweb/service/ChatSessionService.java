package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.extension.service.IService;
import com.plexpt.chatgpt.entity.chat.Message;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * @Description 会话服务接口
 * @Author makun
 * @Date 2024/2/26 15:48
 * @Version 1.0
 */
public interface ChatSessionService extends IService<ChatSession> {
    /**
     * 获取详细的对话历史
     * @param sessionId
     * @return
     */
    List<ChatMessage> getHistoryMsgDetail(String sessionId);

    /**
     * 获取对话的历史消息（简略）
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

    /**
     * 添加一个会话
     * @param chatSessionDto
     * @return
     */
    boolean addOne(ChatSessionDto chatSessionDto);

    /**
     * 获取会话最新的机器人消息
     * @param sessionId
     * @return
     */
    ChatMessage getNewestBotMsg(String sessionId);

    /**
     * 通过对话文件创建会话
     * @param file
     * @param userId
     * @return
     */
    String createByDialogFile(MultipartFile file, String userId);
}
