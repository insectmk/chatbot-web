package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

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
    protected String id;
    protected String username;
    protected String password;
    protected String email;
    protected Timestamp registrationTime;
    protected Timestamp lastLoginTime;
}
