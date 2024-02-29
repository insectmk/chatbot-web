package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * @Description 聊天消息
 * @Author makun
 * @Date 2024/2/25 15:41
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatMessage {
    public static final String SENDER_TYPE_USER = "用户";
    public static final String SENDER_TYPE_BOT = "机器人";

    protected String id;
    protected String sessionId;
    protected String senderType;
    protected String messageId;
    protected String messageContent;
    protected Timestamp sentTime;
}
