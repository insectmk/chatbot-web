package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.configure.SseEmitterUTF8;
import cn.insectmk.chatbotweb.configure.value.SystemValue;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.util.AESUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Objects;

/**
 * @Description 接口控制类
 * @Author makun
 * @Date 2024/2/29 19:10
 * @Version 1.0
 */
@RestController
@RequestMapping("/api")
@RequestLimit(maxCount = 1,second = 5)
@Slf4j
public class ApiController {
    @Autowired
    private ChatMessageService chatMessageService;
    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private AESUtil aesUtil;
    @Autowired
    private SystemValue systemValue;

    /**
     * 获取API说明
     * @return
     */
    @GetMapping("/tips")
    public Result getApiTips() {
        // 获取API说明文档输入流
        InputStream tipsStream = getClass().getResourceAsStream("/template/api-tips.md");
        if (tipsStream == null) {
            throw new BizException("API说明文件未找到！");
        }
        // 创建拼接
        StringBuilder sb = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(tipsStream));
        String line;
        // 读取文件
        try {
            while ((line = reader.readLine()) != null) {
                sb.append(line);
                sb.append(System.lineSeparator());
            }
            // 将url替换为项目地址并返回
            while (sb.indexOf("{{url}}") != -1) {
                sb.replace(sb.indexOf("{{url}}"), sb.indexOf("{{url}}") + "{{url}}".length(), systemValue.getUrl());
            }
            return Result.buildSuccess(sb);
        } catch (IOException e) {
            log.error("API文档读取错误：", e);
        } finally {
            try {
                reader.close();
            } catch (IOException e) {
                log.error("API文档读取错误：", e);
            }
        }
        return Result.buildSuccess();
    }

    /**
     * 发送消息
     * @param key
     * @param chatMessage
     * @return
     */
    @PostMapping("/send/stream")
    public SseEmitter sendStream(String key, @RequestBody ChatMessage chatMessage) {
        String sessionId = aesUtil.decrypt(key);
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }
        // 发送消息
        chatMessage.setSessionId(sessionId);
        SseEmitterUTF8 sseEmitterUTF8 = new SseEmitterUTF8(-1L);
        chatMessageService.sendStream(chatMessage, sseEmitterUTF8);

        return sseEmitterUTF8;
    }

    /**
     * 查询会话所有的历史消息
     * @param key
     * @return
     */
    @GetMapping
    public Result findAllMessage(String key) {
        String sessionId = aesUtil.decrypt(key);
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        return Result.buildSuccess(chatSessionService.getHistoryMsg(sessionId));
    }

    /**
     * 发送消息
     * @param key
     * @param chatMessage
     * @return
     */
    @PostMapping("/send")
    public Result send(String key, @RequestBody ChatMessage chatMessage) {
        String sessionId = aesUtil.decrypt(key);
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        chatMessage.setSessionId(sessionId);

        return Result.buildSuccess(chatMessageService.send(chatMessage));
    }
}
