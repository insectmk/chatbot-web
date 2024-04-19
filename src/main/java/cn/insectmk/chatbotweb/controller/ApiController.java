package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.configure.SseEmitterUTF8;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;
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
public class ApiController {
    @Value(("${system.address}"))
    private String ip;
    @Value("${server.port}")
    private String port;

    @Autowired
    private ChatMessageService chatMessageService;
    @Autowired
    private ChatSessionService chatSessionService;

    /**
     * 获取API说明
     * @return
     */
    @GetMapping("/tips")
    public Result getApiTips() {
        StringBuilder markdown = new StringBuilder();

        markdown.append("## 发送消息\n\n");
        markdown.append("### 普通对话\n\n");
        markdown.append("- 接口地址：`" + "http://").append(ip).append(":").append(port).append("/api/send?key={你的API密钥}`\n");
        markdown.append("- 请求类型：`POST`\n");
        markdown.append("- 请求数据格式：\n");
        markdown.append("  ```json\n");
        markdown.append("  {\n");
        markdown.append("      \"messageContent\": \"你好\"\n");
        markdown.append("  }\n");
        markdown.append("  ```\n\n");
        markdown.append("### 流式对话\n\n");
        markdown.append("- 接口地址：`" + "http://").append(ip).append(":").append(port).append("/api/send/stream?key={你的API密钥}`\n");
        markdown.append("- 请求类型：`POST`\n");
        markdown.append("- 请求数据格式：\n");
        markdown.append("  ```json\n");
        markdown.append("  {\n");
        markdown.append("      \"messageContent\": \"你好\"\n");
        markdown.append("  }\n");
        markdown.append("  ```\n\n");
        markdown.append("## 对话历史\n\n");
        markdown.append("- 接口地址：`" + "http://" + ip + ":" + port + "/api?key={你的API密钥}`\n");
        markdown.append("- 请求类型：`GET`\n\n");
        markdown.append("## 注意\n\n");
        markdown.append("1. 每位用户只能同时拥有一个API密钥\n");
        markdown.append("2. 重新生成API密钥会导致旧密钥的失效，并且会清除所有对话内容\n");

        return Result.buildSuccess(markdown);
    }

    /**
     * 发送消息
     * @param key
     * @param chatMessage
     * @return
     */
    @PostMapping("/send/stream")
    public SseEmitter sendStream(String key, @RequestBody ChatMessage chatMessage) {
        String sessionId = key;
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
        String sessionId = key;
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
        String sessionId = key;
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        chatMessage.setSessionId(sessionId);

        return Result.buildSuccess(chatMessageService.send(chatMessage));
    }
}
