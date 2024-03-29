package cn.insectmk.chatbotweb.controller.dto;

import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.util.RegularUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

/**
 * @Description 用户传输对象
 * @Author makun
 * @Date 2024/2/29 20:32
 * @Version 1.0
 */
@EqualsAndHashCode(callSuper = true)
@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserDto extends User {
    @NotNull(message = "请输入验证码")
    @NotBlank(message = "请输入验证码")
    @Pattern(regexp = RegularUtil.CAPTCHA, message = "验证码格式不正确")
    private String captcha;
}
