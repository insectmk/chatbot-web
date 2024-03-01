package cn.insectmk.chatbotweb.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * @Description 登录控制器
 * @Author makun
 * @Date 2024/2/29 20:13
 * @Version 1.0
 */
@RestController
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private UserService userService;

    /**
     * 生成图形验证码
     * @param response
     * @param session
     * @throws IOException
     */
    @GetMapping("/captcha")
    public void captcha(HttpServletResponse response, HttpSession session) throws IOException {
        // 定义图形验证码的长、宽、验证码字符数、干扰线宽度
        ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(200, 100, 4, 4);
        // 将验证码装到Session中
        session.setAttribute("captcha", captcha.getCode());
        // 将图片装载到输出流中
        ServletOutputStream outputStream = response.getOutputStream();
        ImageIO.write(captcha.getImage(),"JPEG",outputStream);
    }

    /**
     * 登录并获取token
     * @param userDto
     * @return
     */
    @PostMapping
    public Result login(@RequestBody UserDto userDto, HttpSession session) {
        // 如果验证码对不上就拒绝登录
        if (!session.getAttribute("captcha").equals(userDto.getCaptcha())) {
            return Result.buildFail("验证码不正确");
        }
        // 登录
        String token = userService.login(userDto.getEmail(), userDto.getPassword());
        return StringUtils.isNotBlank(token) ?
                Result.buildSuccess(token) :
                Result.buildFail("登录失败，邮箱或密码不正确");
    }
}
