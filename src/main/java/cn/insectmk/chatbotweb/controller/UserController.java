package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Objects;

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
     * 通过注册链接注册用户
     * @param key
     * @return
     */
    @GetMapping("/register")
    public Result register(String key) {
        User user = userService.register(key);
        return Objects.isNull(user) ? Result.buildFail("注册失败") :
                Result.buildSuccess("请返回登录界面完成登录");
    }

    /**
     * 注册用户
     * @param userDto
     * @return
     */
    @PostMapping("/register")
    public Result register(@RequestBody UserDto userDto, HttpSession session) {
        // 如果验证码对不上就拒绝注册
        if (!session.getAttribute("captcha").equals(userDto.getCaptcha())) {
            return Result.buildFail("验证码不正确");
        }
        // 发送注册链接
        userService.sendRegisterUrl(userDto);
        return Result.buildSuccess("请点击邮箱的注册链接完成注册");
    }

    /**
     * 刷新并获取接口密钥
     * @param request
     * @return
     */
    @GetMapping("/apiKey")
    public Result getApiKey(HttpServletRequest request) {
        return Result.buildSuccess(userService
                .getApiKey(request
                        .getAttribute("userId")
                        .toString()));
    }
}
