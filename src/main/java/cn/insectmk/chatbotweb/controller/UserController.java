package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    public Result login(@RequestBody User user) {
        String token = userService.login(user.getEmail(), user.getPassword());
        return StringUtils.isNotBlank(token) ?
                Result.buildSuccess(token) :
                Result.buildFail("登录失败，邮箱或密码不正确");
    }

    @GetMapping
    public Result findAll() {
        return Result.buildSuccess(userService.list());
    }
}
