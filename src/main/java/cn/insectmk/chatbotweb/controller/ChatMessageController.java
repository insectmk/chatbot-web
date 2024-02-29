package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ChatMessageDto;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Description 聊天消息控制类
 * @Author makun
 * @Date 2024/2/29 8:43
 * @Version 1.0
 */
@RestController
@RequestMapping("/chatMessage")
public class ChatMessageController {
    @Autowired
    private ChatMessageService chatMessageService;

    /**
     * 发送消息
     * @param chatMessageDto
     * @return
     */
    @PostMapping
    public Result send(@RequestBody ChatMessageDto chatMessageDto) {
        return Result.buildSuccess(chatMessageService.send(chatMessageDto));
    }
}
