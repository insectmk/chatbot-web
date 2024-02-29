package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.HttpApiRequestDto;
import cn.insectmk.chatbotweb.controller.vo.HttpApiResponseVo;
import cn.insectmk.chatbotweb.service.ChatGlmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

/**
 * @Description ChatGlm2-6B服务接口实现类
 * @Author makun
 * @Date 2024/2/29 9:27
 * @Version 1.0
 */
@Service
public class ChatGlmServiceImpl implements ChatGlmService {
    @Value("${glm.http-url}")
    private String httpUrl;

    @Autowired
    private RestTemplate restTemplate;

    @Override
    public HttpApiResponseVo send(HttpApiRequestDto request) {
        return restTemplate.postForObject(httpUrl, request, HttpApiResponseVo.class);
    }
}
