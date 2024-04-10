package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.configure.SseEmitterUTF8;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.util.AESUtil;
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
    @Value(("${server.address}"))
    private String ip;
    @Value("${server.port}")
    private String port;

    @Autowired
    private ChatMessageService chatMessageService;
    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private AESUtil aesUtil;

    /**
     * 获取API说明
     * @return
     */
    @GetMapping("/tips")
    public Result getApiTips() {
        String sendUrl = "http://" + ip + ":" + port + "/api/send?key={你的API密钥}";
        String historyUrl = "http://" + ip + ":" + port + "/api?key={你的API密钥}";
        StringBuilder sb = new StringBuilder();
        sb.append("发送消息（GET）：");
        sb.append(sendUrl);
        sb.append("\n");
        sb.append("历史消息（POST）：");
        sb.append(historyUrl);

        return Result.buildSuccess(sb);
    }

    /**
     * 发送消息
     * @param key
     * @param chatMessage
     * @return
     */
    @PostMapping("/send/stream")
    public SseEmitter sendStream(String key, @RequestBody ChatMessage chatMessage) {
        String sessionId = aesUtil.decrypt(key.replaceAll(" ", "+"));
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
        String sessionId = aesUtil.decrypt(key.replaceAll(" ", "+"));
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
        String sessionId = aesUtil.decrypt(key.replaceAll(" ", "+"));
        // 判断会话是否存在
        if (Objects.isNull(chatSessionService.getById(sessionId))) {
            throw new BizException("该接口已失效");
        }

        chatMessage.setSessionId(sessionId);

        return Result.buildSuccess(chatMessageService.send(chatMessage));
    }
}
