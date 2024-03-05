package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.plexpt.chatgpt.entity.chat.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description 会话表映射
 * @Author makun
 * @Date 2024/2/25 16:39
 * @Version 1.0
 */
public interface ChatSessionMapper extends BaseMapper<ChatSession> {
     /**
      * 查询会话的历史对话
      * @param sessionId
      * @return
      */
     List<Message> selectHistoryMsg(@Param("sessionId") String sessionId);
}
