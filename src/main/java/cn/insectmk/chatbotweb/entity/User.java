package cn.insectmk.chatbotweb.entity;

import cn.insectmk.chatbotweb.util.RegularUtil;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;
import java.util.Date;

/**
 * @Description 用户
 * @Author makun
 * @Date 2024/2/25 15:30
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class User {
    //@JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    protected String id;
    @Pattern(regexp = RegularUtil.USERNAME, message = "用户名格式不正确")
    protected String username;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @Pattern(regexp = RegularUtil.PASSWORD, message = "密码格式不正确")
    protected String password;
    @Email(message = "邮箱格式不正确")
    protected String email;
    protected String head;
    protected String apiKey;
    protected Long maxSession;
    protected Long maxToken;
    protected Date registrationTime;
    protected Date lastLoginTime;
}
