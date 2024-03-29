package cn.insectmk.chatbotweb.service.impl;

import cn.hutool.core.lang.Assert;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.junit.jupiter.api.Assertions;
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
    void register() {
        userService.register("GbSQtTeQyK54Bt1mmjLWpEyrNwzInrN7fzrYDTFPceI=");
    }

    @Test
    void sendRegisterUrl() {
        UserDto userDto = new UserDto();
        userDto.setEmail("2514378105@qq.com");
        userDto.setUsername("MaKun");
        userDto.setPassword("123456");
        userService.sendRegisterUrl(userDto);
    }

    @Test
    public void saveOne() {
        User user = new User(
                null,
                aesUtil.encrypt("InsectMk", null),
                aesUtil.encrypt("123456", null),
                aesUtil.encrypt("3067836615@qq.com", null),
                "https://insectmk.cn/static/img/head/insectmk.png",
                null,
                null,
                null
        );
        userService.save(user);

        System.out.println(userService.getOne(new LambdaQueryWrapper<User>()
                .eq(User::getId, user.getId())));
    }

    @Test
    void deleteOne() {
        Assertions.assertTrue(userService.deleteOne("18ce1152a25675a8f4d76b2b000caa5f"));
        Assertions.assertTrue(userService.deleteOne("2486c503cc22b4af6bbd8456176c0442"));
        Assertions.assertTrue(userService.deleteOne("57941a8788854c4146d247160113684b"));
    }
}
