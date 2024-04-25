package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Description 模型评分实体
 * @Author makun
 * @Date 2024/4/24 13:25
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ModelRate {
    protected String id;
    protected String userId;
    protected String username;
    protected String modelVersionId;
    protected Integer rate;
    protected String comment;
    protected Date createTime;
}
