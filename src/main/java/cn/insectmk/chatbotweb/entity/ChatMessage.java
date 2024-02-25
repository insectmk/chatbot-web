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
    public enum SenderType {
        USER("用户"),BOT("机器人");

        final String type;

        SenderType(String typeName) {
            this.type = typeName;
        }

        @Override
        public String toString() {
            return this.type;
        }
    }

    private Integer id;
    private Integer sessionId;
    private SenderType senderType;
    private Timestamp sentTime;
}
