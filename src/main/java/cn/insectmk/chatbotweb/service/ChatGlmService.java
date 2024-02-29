package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.HttpApiRequestDto;
import cn.insectmk.chatbotweb.controller.vo.HttpApiResponseVo;

/**
 * @Description ChatGLM2-6B服务接口
 * @Author makun
 * @Date 2024/2/29 9:25
 * @Version 1.0
 */
public interface ChatGlmService {
    /**
     * 使用HTTP接口发送消息
     * @param request
     * @return
     */
    HttpApiResponseVo send(HttpApiRequestDto request);
}
