package cn.insectmk.chatbotweb.test;

import cn.insectmk.chatbotweb.controller.dto.HttpApiRequestDto;
import cn.insectmk.chatbotweb.controller.vo.HttpApiResponseVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.client.RestTemplate;

/**
 * @Description 使用RestTemplate访问HTTP接口
 * @Author makun
 * @Date 2024/2/29 8:55
 * @Version 1.0
 */
@SpringBootTest
public class RestTemplateHttpCaller {
    @Autowired
    private RestTemplate restTemplate;

    @Test
    void test() {
        // 使用 postForObject() 方法发送 POST 请求并接收对象响应
        String postUrl = "http://localhost:8000/";
        HttpApiRequestDto request = new HttpApiRequestDto("你好", null);
        HttpApiResponseVo postResponse = restTemplate.postForObject(postUrl, request, HttpApiResponseVo.class);
        System.out.println(postResponse);
    }
}
