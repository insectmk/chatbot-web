package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

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
    protected String id;
    protected String name;
    protected String versionNumber;
    protected Date deploymentTime;
    protected String remark;
}
