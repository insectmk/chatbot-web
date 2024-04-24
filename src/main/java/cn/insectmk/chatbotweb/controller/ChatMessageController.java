package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.controller.dto.ChatMessageDto;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

/**
 * @Description 聊天消息控制类
 * @Author makun
 * @Date 2024/2/29 8:43
 * @Version 1.0
 */
@RestController
@RequestMapping("/chatMessage")
@RequestLimit(maxCount = 1,second = 5)
public class ChatMessageController {
    @Autowired
    private ChatMessageService chatMessageService;

    /**
     * 更新聊天消息的信息（点赞功能）
     * @param chatMessageDto
     * @return
     */
    @PutMapping
    public Result edit(@RequestBody ChatMessageDto chatMessageDto) {
        return chatMessageService.updateById(chatMessageDto) ?
                Result.buildSuccess() :
                Result.buildFail();
    }

    /**
     * 发送消息（流式输出）
     * @param chatMessageDto
     * @return
     */
    @RequestLimit(maxCount = 1000,second = 1)
    @PostMapping("/stream")
    public SseEmitter sendStream(@RequestBody ChatMessageDto chatMessageDto) {
        SseEmitter sseEmitter = new SseEmitter(-1L);
        chatMessageService.sendStream(chatMessageDto, sseEmitter);
        return sseEmitter;
    }

    /**
     * 发送消息
     * @param chatMessage
     * @return
     */
    @PostMapping
    public Result send(@RequestBody ChatMessage chatMessage) {
        return Result.buildSuccess(chatMessageService.send(chatMessage));
    }
}
