package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserServiceImplTest {
    @Autowired
    private UserService userService;
    @Autowired
    private AESUtil aesUtil;

    @Test
    public void saveOne() {
        User user = new User(
                null,
                aesUtil.encrypt("InsectMk", null),
                aesUtil.encrypt("123456", null),
                aesUtil.encrypt("3067836615@qq.com", null),
                null,
                null,
                null
        );
        userService.save(user);

        System.out.println(userService.getOne(new LambdaQueryWrapper<User>()
                .eq(User::getId, user.getId())));
    }
}
