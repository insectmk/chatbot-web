package cn.insectmk.chatbotweb.controller;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.ShearCaptcha;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.service.UserService;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;
import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @Description 登录控制器
 * @Author makun
 * @Date 2024/2/29 20:13
 * @Version 1.0
 */
@RestController
@RequestMapping("/login")
@RequestLimit(maxCount = 1,second = 10)
public class LoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private RedisTemplate<String, String> redisTemplate;

    /**
     * 判断用户是谁的接口
     * @param token
     * @return
     */
    @GetMapping("/isWho")
    public Result isWho(String token) {
        return Result.buildSuccess(userService.isWho(token));
    }

    /**
     * 判断是否为root
     * @param token
     * @return
     */
    @GetMapping("/isRoot")
    @RequestLimit(maxCount = 5,second = 1)
    public Result isRoot(String token) {
        return userService.isTokenRoot(token) ?
                Result.build(true, "是Root用户", null) :
                Result.buildFail("不为Root用户");
    }

    /**
     * 判断令牌是否有效
     * @param token
     * @return
     */
    @GetMapping("/isToken")
    @RequestLimit(maxCount = 5,second = 1)
    public Result isToken(String token) {
        return userService.isTokenEffective(token) ?
                Result.build(true, "令牌有效", null) :
                Result.buildFail("令牌无效");
    }

    /**
     * 生成图形验证码
     * @param response
     * @param httpServletRequest
     * @throws IOException
     */
    @GetMapping("/captcha")
    @RequestLimit(maxCount = 1,second = 1)
    public void captcha(HttpServletResponse response, HttpServletRequest httpServletRequest) throws IOException {
        // 定义图形验证码的长、宽、验证码字符数、干扰线宽度
        ShearCaptcha captcha = CaptchaUtil.createShearCaptcha(120,48,4,5);
        // 将验证码装到Redis中（5分钟失效）
        redisTemplate.opsForValue().set(captcha.getCode().toUpperCase(), httpServletRequest.getRemoteAddr(), 5, TimeUnit.MINUTES);
        httpServletRequest.getSession().setAttribute("captcha", captcha.getCode());
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
    public Result login(@Valid @RequestBody UserDto userDto, HttpServletRequest httpServletRequest) {
        // 如果验证码对不上就拒绝登录
        String ip = redisTemplate.opsForValue().get(userDto.getCaptcha().toUpperCase());
        if (!httpServletRequest.getRemoteAddr().equals(ip)) {
            return Result.buildFail("验证码不正确");
        }
        // 删除验证码
        redisTemplate.delete(userDto.getCaptcha());
        // 登录
        String token = userService.login(userDto.getEmail(), userDto.getPassword());
        return StringUtils.isNotBlank(token) ?
                Result.buildSuccess("登录成功！",token) :
                Result.buildFail("登录失败，邮箱或密码不正确");
    }
}
