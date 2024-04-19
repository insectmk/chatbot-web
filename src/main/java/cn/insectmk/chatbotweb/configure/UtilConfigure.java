package cn.insectmk.chatbotweb.configure;

import cn.insectmk.chatbotweb.configure.value.AliyunOSSConfigValue;
import cn.insectmk.chatbotweb.util.*;
import org.springframework.beans.factory.annotation.Autowired;
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
    @Autowired
    private AliyunOSSConfigValue aliyunOSSConfig;

    @Bean
    public AliyunOSSUtil ossUtil() {
        return new AliyunOSSUtil(aliyunOSSConfig);
    }

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder) {
        return builder.build();
    }
}
