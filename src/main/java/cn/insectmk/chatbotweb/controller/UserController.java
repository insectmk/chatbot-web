package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.BizLog;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Objects;

/**
 * @Description 用户功能控制器
 * @Author makun
 * @Date 2024/2/26 16:03
 * @Version 1.0
 */
@RestController
@RequestMapping("/user")
@RequestLimit(maxCount = 1,second = 1)
public class UserController {
    @Autowired
    private UserService userService;

    /**
     * 修改用户密码
     * @param user
     * @param request
     * @return
     */
    @PutMapping("/password")
    @BizLog(level = SystemLog.LEVEL_INFO, message = "修改密码")
    public Result password(@RequestBody User user, HttpServletRequest request) {
        return userService.updatePassword(request.getAttribute("userId").toString(), user.getPassword()) ?
                Result.buildSuccess("密码更新成功！",null) :
                Result.buildFail("密码更新失败！");
    }

    /**
     * 删除用户
     * @param request
     * @return
     */
    @DeleteMapping
    @BizLog(level = SystemLog.LEVEL_INFO, message = "注销用户")
    public Result delete(HttpServletRequest request) {
        return userService.deleteOne(request.getAttribute("userId").toString()) ?
                Result.buildSuccess("删除成功！", null) :
                Result.buildFail("删除失败！");
    }

    /**
     * 获取用户基本信息
     * @param request
     * @return
     */
    @GetMapping
    public Result info(HttpServletRequest request) {
        return Result.buildSuccess(userService.getUserInfo(request.getAttribute("userId").toString()));
    }

    /**
     * 通过注册链接注册用户
     * @param key
     * @return
     */
    @GetMapping("/register")
    @BizLog(level = SystemLog.LEVEL_INFO, message = "用户注册")
    public Result register(String key) {
        User user = userService.register(key);
        return Objects.isNull(user) ? Result.buildFail("注册失败") :
                Result.buildSuccess("请返回登录界面完成登录", null);
    }

    /**
     * 注册用户
     * @param userDto
     * @return
     */
    @PostMapping("/register")
    public Result register(@Valid @RequestBody UserDto userDto, HttpSession session) {
        // 如果验证码对不上就拒绝注册
        if (!session.getAttribute("captcha").equals(userDto.getCaptcha())) {
            return Result.buildFail("验证码不正确");
        }
        // 发送注册链接
        userService.sendRegisterUrl(userDto);
        return Result.buildSuccess("请在[5分钟内]点击邮箱的注册链接完成注册", null);
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
