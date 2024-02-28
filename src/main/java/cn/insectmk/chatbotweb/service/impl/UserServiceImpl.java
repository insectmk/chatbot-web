package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import cn.insectmk.chatbotweb.util.JWTUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Objects;

/**
 * @Description 用户服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:02
 * @Version 1.0
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private AESUtil aesUtil;
    @Autowired
    private JWTUtil jwtUtil;

    @Override
    public String login(String email, String password) {
        User user = baseMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, aesUtil.encrypt(email))
                .eq(User::getPassword, aesUtil.encrypt(password)));

        if (Objects.isNull(user)) {
            return null;
        }

        return jwtUtil.generateJWT(user);
    }
}
