package cn.insectmk.chatbotweb.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

/**
 * @Description URL工具
 * @Author makun
 * @Date 2024/4/19 13:39
 * @Version 1.0
 */
@Component
public class URLUtil {
    @Autowired
    private RestTemplate restTemplate;

    /**
     * 判断url是否在线
     * @param url
     * @return
     */
    public boolean isUrlOnline(String url) {
        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
            // 检查响应状态码，200表示在线
            return response.getStatusCode().is2xxSuccessful();
        } catch (Exception e) {
            // 捕获异常，说明URL不可达
            return false;
        }
    }
}
