package cn.insectmk.chatbotweb.init;

import cn.insectmk.chatbotweb.configure.CustomerSystemConfigValue;
import cn.insectmk.chatbotweb.configure.WebSecurityConfig;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.util.AESUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.stereotype.Component;

/**
 * @Description 生成权限用户
 * @Author makun
 * @Date 2024/4/8 10:18
 * @Version 1.0
 */
@Component
public class GenerateSecurityUser implements CommandLineRunner {
    @Autowired
    private CustomerSystemConfigValue customerSystemConfigValue;
    @Autowired
    private InMemoryUserDetailsManager inMemoryUserDetailsManager;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AESUtil aesUtil;

    @Override
    public void run(String... args) throws Exception {
        for (String email : customerSystemConfigValue.getRootEmail()) {
            User user = userMapper.selectOne(new LambdaQueryWrapper<User>()
                    .eq(User::getEmail, aesUtil.encrypt(email)));
            // 添加Admin用户
            inMemoryUserDetailsManager.createUser(org.springframework.security.core.userdetails.User.withUsername(aesUtil.decrypt(user.getEmail()))
                    .password(PasswordEncoderFactories.createDelegatingPasswordEncoder().encode(aesUtil.decrypt(user.getPassword())))
                    .authorities(WebSecurityConfig.ACCOUNT_CLIENT_AUTHORITY).build());
        }
    }
}
