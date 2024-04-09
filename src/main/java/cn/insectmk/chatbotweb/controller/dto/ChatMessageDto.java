package cn.insectmk.chatbotweb.controller.dto;

import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Description 聊天消息传输对象
 * @Author makun
 * @Date 2024/2/29 9:34
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ChatMessageDto extends ChatMessage {
    private ChatSession chatSession;
}
