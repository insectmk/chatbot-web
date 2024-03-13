package cn.insectmk.chatbotweb.configure;

import cn.insectmk.chatbotweb.util.EmailUtil;
import cn.insectmk.chatbotweb.util.JWTUtil;
import cn.insectmk.chatbotweb.util.JsonUtil;
import cn.insectmk.chatbotweb.util.AESUtil;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

/**
 * @Description 工具类注册
 * @Author makun
 * @Date 2024/2/27 20:08
 * @Version 1.0
 */
@Configuration
public class UtilConfigure {
    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
    }

    @Bean
    public AESUtil aesUtil() {
        return new AESUtil();
    }

    @Bean
    public JsonUtil jsonUtil() {
        return new JsonUtil();
    }

    @Bean
    public EmailUtil emailUtil() {
        return new EmailUtil();
    }

    @Bean
    public JWTUtil jwtUtil() {
        return new JWTUtil();
    }
}
