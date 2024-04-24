package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

/**
 * @Description 搭档评分实体
 * @Author makun
 * @Date 2024/4/24 14:12
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class PartnerRate {
    protected String id;
    protected String userId;
    protected String username;
    protected String partnerId;
    protected Integer rate;
    protected String comment;
    protected Date createTime;
}
