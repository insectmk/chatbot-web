package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

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
    protected String id;
    protected String userId;
    protected String modelVersionId;
    protected String remark;
    protected Date startTime;
    protected Date endTime;
}
