package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

/**
 * @Description 聊天消息服务接口
 * @Author makun
 * @Date 2024/2/26 15:48
 * @Version 1.0
 */
public interface ChatMessageService extends IService<ChatMessage> {
    /**
     * 发送消息，流式布局
     * @param chatMessage
     * @return
     */
    void sendStream(ChatMessage chatMessage, SseEmitter sseEmitter);

    /**
     * 发送消息，RWKV版本
     * @param chatMessage
     * @return
     */
    String send(ChatMessage chatMessage);
}
