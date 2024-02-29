package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.common.Dialog;
import cn.insectmk.chatbotweb.entity.ChatSession;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

/**
 * @Description 会话表映射
 * @Author makun
 * @Date 2024/2/25 16:39
 * @Version 1.0
 */
public interface ChatSessionMapper extends BaseMapper<ChatSession> {
     /**
      * 根据会话ID查询所有的对话消息并装载到数组中
      * 模板格式：[["你好","你好👋！我是人工智能助手 ChatGLM2-6B，很高兴见到你，欢迎问我任何问题。"]]
      * @param sessionId
      * @return
      */
     ArrayList<Dialog> selectHistoryMessageBySessionId(@Param("sessionId") String sessionId);
}
