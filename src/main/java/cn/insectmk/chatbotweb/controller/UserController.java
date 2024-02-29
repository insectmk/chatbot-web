package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

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
     * 注册用户
     * @param user
     * @return
     */
    @GetMapping("/register")
    public Result register(User user) {
        return null;
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
