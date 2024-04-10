package cn.insectmk.chatbotweb.util;

/**
 * @Description 正则工具类
 * @Author makun
 * @Date 2024/3/29 13:06
 * @Version 1.0
 */
public class RegularUtil {
    // 用户名，2-20位
    public static final String USERNAME = "^.{2,20}$";
    // 邮箱
    public static final String EMAIL = "^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,6}$";
    // 密码：至少包含数字、字母和特殊字符，并且长度在6到24位之间
    public static final String PASSWORD = "^(?=.*\\d)(?=.*[a-zA-Z])(?=.*[\\W_]).{6,24}$";
    // 验证码：由4个字符组成的图形验证码
    public static final String CAPTCHA = "^[a-zA-Z0-9]{4}$";
    // 匹配接口地址
    public static final String API_URL = "^(https?://)(?:\\w+\\.)+\\w+(?::\\d{2,5})?(?:/)?$";
}
