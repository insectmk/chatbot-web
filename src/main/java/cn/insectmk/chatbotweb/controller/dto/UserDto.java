package cn.insectmk.chatbotweb.controller.dto;

import cn.insectmk.chatbotweb.entity.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

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
    private String captcha;
}
