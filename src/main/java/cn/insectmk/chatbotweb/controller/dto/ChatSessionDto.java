package cn.insectmk.chatbotweb.controller.dto;

import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * @Description 会话传输对象
 * @Author makun
 * @Date 2024/2/29 9:50
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class ChatSessionDto extends ChatSession {
    private ModelVersion modelVersion;
}
