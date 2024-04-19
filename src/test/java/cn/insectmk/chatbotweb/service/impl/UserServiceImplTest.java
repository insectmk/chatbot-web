package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.service.UserService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class UserServiceImplTest {
    @Autowired
    private UserService userService;

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

    }

    @Test
    void deleteOne() {
        Assertions.assertTrue(userService.deleteOne("18ce1152a25675a8f4d76b2b000caa5f"));
        Assertions.assertTrue(userService.deleteOne("2486c503cc22b4af6bbd8456176c0442"));
        Assertions.assertTrue(userService.deleteOne("57941a8788854c4146d247160113684b"));
    }

    @Test
    void testSendRegisterUrl() {
        UserDto userDto = new UserDto();
        userDto.setUsername("马某人");
        userDto.setPassword("$123456InsectMk");
        userDto.setEmail("2514378105@qq.com");
        Assertions.assertTrue(userService.sendRegisterUrl(userDto));
    }
}
