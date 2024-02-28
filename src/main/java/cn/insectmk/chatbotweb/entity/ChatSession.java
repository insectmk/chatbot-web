package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

/**
 * @Description 会话
 * @Author makun
 * @Date 2024/2/25 15:39
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ChatSession {
    private String id;
    private String userId;
    private String modelVersionId;
    private Timestamp startTime;
    private Timestamp endTime;
}
