package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

/**
 * @Description 搭档实体类
 * @Author makun
 * @Date 2024/4/23 9:31
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Partner {
    protected String id;
    protected String userId;
    protected String name;
    protected String prompt;
    protected String head;
    protected Boolean isPublic;
    protected Date createTime;
}
