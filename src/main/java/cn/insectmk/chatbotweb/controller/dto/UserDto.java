package cn.insectmk.chatbotweb.controller.dto;

import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.util.RegularUtil;
import lombok.Data;
import lombok.EqualsAndHashCode;
import javax.validation.constraints.Pattern;

/**
 * @Description 用户传输对象
 * @Author makun
 * @Date 2024/2/29 20:32
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@Data
public class UserDto extends User {
    @Pattern(regexp = RegularUtil.CAPTCHA, message = "验证码格式不正确")
    private String captcha;
    private Boolean isUploadHead;
    /**
     * 失效时间戳
     */
    private Long expiration;
}
