package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.UserDto;
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
     * 根据ID删除一个用户
     * @param userId
     * @return
     */
    boolean deleteOne(String userId);

    /**
     * 根据Id获取用户信息
     * @param userId 用户ID
     * @return
     */
    User getUserInfo(String userId);

    /**
     * 通过注册key注册用户
     * @param key
     * @return
     */
    User register(String key);

    /**
     * 生成注册URL
     * @param userDto
     * @return
     */
    boolean sendRegisterUrl(UserDto userDto);

    /**
     * 为用户生成APIKey
     * @param userId
     * @return
     */
    String getApiKey(String userId);

    /**
     * 判断token是否有效
     * @param token
     * @return
     */
    boolean isTokenEffective(String token);

    /**
     * 用户登录
     * @param email 邮箱地址
     * @param password 登陆密码
     * @return JWT字符串
     */
    String login(String email, String password);
}
