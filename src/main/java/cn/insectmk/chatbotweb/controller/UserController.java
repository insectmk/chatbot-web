package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

/**
 * @Description 用户功能控制器
 * @Author makun
 * @Date 2024/2/26 16:03
 * @Version 1.0
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 登录并获取token
     * @param user
     * @return
     */
    @PostMapping("/login")
    public Result login(User user) {
        return Result.buildFail();
    }

    @GetMapping
    public Result findAll() {
        return Result.buildSuccess(userService.list());
    }
}
