package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import java.util.Objects;

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
     * 删除会话
     * @param request
     * @param sessionId
     * @return
     */
    @DeleteMapping
    public Result delete(HttpServletRequest request, String sessionId) {
        if (Objects.isNull(chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, sessionId)
                .eq(ChatSession::getUserId, request.getAttribute("userId").toString())))) {
            throw new BizException("您无权访问此会话");
        }
        
        return chatSessionService.deleteById(sessionId) ?
                Result.buildSuccess() :
                Result.buildFail();
    }

    /**
     * 获取用户所有的会话
     * @param request
     * @return
     */
    @GetMapping("/all")
    public Result findAll(HttpServletRequest request) {
        return Result.buildSuccess(chatSessionService
                .getAllChatSession(request
                        .getAttribute("userId")
                        .toString()));
    }

    /**
     * 查询会话所有的历史消息
     * @param sessionId
     * @return
     */
    @GetMapping
    public Result findAllMessage(HttpServletRequest request, String sessionId) {
        if (Objects.isNull(chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, sessionId)
                .eq(ChatSession::getUserId, request.getAttribute("userId").toString())))) {
            throw new BizException("您无权访问此会话");
        }
        return Result.buildSuccess(chatSessionService.getHistoryMessageBySessionId(sessionId));
    }

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
                chatSessionDto.getRemark(),
                null,
                null,
                ChatSession.STATUS_FREE
        );

        return chatSessionService.save(chatSession) ? Result.buildSuccess(chatSession) : Result.buildFail();
    }
}
