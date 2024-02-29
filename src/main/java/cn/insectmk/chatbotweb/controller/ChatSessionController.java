package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 会话控制类
 * @Author makun
 * @Date 2024/2/29 8:41
 * @Version 1.0
 */
@RestController
@RequestMapping("/chatSession")
public class ChatSessionController {
    @Autowired
    private ChatSessionService chatSessionService;

    /**
     * 创建一个会话
     * @param request
     * @param chatSessionDto
     * @return
     */
    @PostMapping
    public Result create(HttpServletRequest request,
                         @RequestBody ChatSessionDto chatSessionDto) {
        String userId = request.getAttribute("userId").toString();

        ChatSession chatSession = new ChatSession(
                null,
                userId,
                chatSessionDto.getModelVersionId(),
                null,
                null,
                ChatSession.STATUS_FREE
        );

        return chatSessionService.save(chatSession) ? Result.buildSuccess(chatSession) : Result.buildFail();
    }
}
