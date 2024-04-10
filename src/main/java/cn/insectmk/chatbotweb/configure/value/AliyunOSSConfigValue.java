package cn.insectmk.chatbotweb.configure.value;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Repository;

/**
 * @Description 阿里云OSS配置
 * @Author makun
 * @Date 2023/9/15 9:33
 * @Version 1.0
 */
@ConfigurationProperties(prefix = "aliyun.oss")
@Repository
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AliyunOSSConfigValue {
    protected String endpoint;
    protected String accessKeyId;
    protected String accessKeySecret;
    protected String bucketName;
    protected String url;
    protected String pathUserHead;
}
