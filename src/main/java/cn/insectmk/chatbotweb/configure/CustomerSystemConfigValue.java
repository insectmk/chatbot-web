package cn.insectmk.chatbotweb.configure;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;
import java.util.List;

/**
 * @Description 自定义系统配置
 * @Author makun
 * @Date 2024/4/8 10:33
 * @Version 1.0
 */
@Data
@Configuration
@ConfigurationProperties("system")
public class CustomerSystemConfigValue {
    private List<String> rootEmail;
}
