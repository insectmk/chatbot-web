package cn.insectmk.chatbotweb.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import java.util.Collections;

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
            HttpHeaders headers = new HttpHeaders();
            headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
            headers.add("user-agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36");
            HttpEntity<String> entity = new HttpEntity<>(headers);
            ResponseEntity<String> response = restTemplate.exchange(url,
                    HttpMethod.GET,
                    entity,
                    String.class);
            // 检查响应状态码，200表示在线
            return response.getStatusCode().is2xxSuccessful();
        } catch (Exception e) {
            // 捕获异常，说明URL不可达
            return false;
        }
    }
}
