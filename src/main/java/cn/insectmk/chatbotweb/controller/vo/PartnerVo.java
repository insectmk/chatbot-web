package cn.insectmk.chatbotweb.controller.vo;

import cn.insectmk.chatbotweb.entity.Partner;
import cn.insectmk.chatbotweb.entity.User;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @Description 搭档视图对象
 * @Author makun
 * @Date 2024/4/23 18:10
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class PartnerVo extends Partner {
    private User user;
}
