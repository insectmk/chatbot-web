package cn.insectmk.chatbotweb.entity;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
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
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    protected String id;
    protected String username;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    protected String password;
    protected String email;
    protected String head;
    protected String apiKey;
    protected Date registrationTime;
    protected Date lastLoginTime;
}
