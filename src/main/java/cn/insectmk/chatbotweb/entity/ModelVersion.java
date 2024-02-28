package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.sql.Timestamp;

/**
 * @Description 模型版本
 * @Author makun
 * @Date 2024/2/25 16:06
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ModelVersion {
    private String id;
    private String name;
    private String versionNumber;
    private Timestamp deploymentTime;
    private String remarks;
}
