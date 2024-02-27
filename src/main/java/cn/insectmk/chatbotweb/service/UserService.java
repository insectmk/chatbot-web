package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description 用户服务接口
 * @Author makun
 * @Date 2024/2/26 15:50
 * @Version 1.0
 */
public interface UserService extends IService<User> {
    /**
     * 用户登录
     * @param email 邮箱地址
     * @param password 登陆密码
     * @return JWT字符串
     */
    String login(String email, String password);
}
