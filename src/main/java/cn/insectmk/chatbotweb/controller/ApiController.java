package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ChatMessageDto;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.util.AESUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

/**
 * @Description 接口控制类
 * @Author makun
 * @Date 2024/2/29 19:10
 * @Version 1.0
 */
@RestController
@RequestMapping("/api")
public class ApiController {
    @Autowired
    private ChatMessageService chatMessageService;
    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private AESUtil aesUtil;

    /**
     * 查询会话所有的历史消息
     * @param key
     * @return
     */
    @GetMapping
    public Result findAllMessage(String key) {
        String sessionId = aesUtil.decrypt(key.replaceAll(" ", "+"));
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        return Result.buildSuccess(chatSessionService.getHistoryMessageBySessionId(sessionId));
    }

    /**
     * 发送消息
     * @param key
     * @param chatMessageDto
     * @return
     */
    @PostMapping("/send")
    public Result send(String key, @RequestBody ChatMessageDto chatMessageDto) {
        String sessionId = aesUtil.decrypt(key.replaceAll(" ", "+"));
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        chatMessageDto.setSessionId(sessionId);

        return Result.buildSuccess(chatMessageService.send(chatMessageDto));
    }
}
