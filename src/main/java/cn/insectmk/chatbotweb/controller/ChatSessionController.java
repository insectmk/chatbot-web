package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.RequestLimit;
import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.util.FileUrlCatchUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Objects;

/**
 * @Description 会话控制类
 * @Author makun
 * @Date 2024/2/29 8:41
 * @Version 1.0
 */
@RestController
@RequestMapping("/chatSession")
@RequestLimit(maxCount = 20,second = 1)
public class ChatSessionController {
    @Autowired
    private ChatSessionService chatSessionService;

    /**
     * 对话txt导入为会话
     * @param file
     * @return
     */
    @PostMapping("/upload")
    public Result userHeadUpload(MultipartFile file, HttpServletRequest httpServletRequest) {
        // 确保文件不为空
        if (file.isEmpty()) {
            return Result.buildFail("文件不能为空");
        }
        return Result.buildSuccess("上传成功", chatSessionService.createByDialogFile(file,httpServletRequest.getAttribute("userId").toString()));
    }

    /**
     * 获取会话最新的机器人消息
     * @param request
     * @param sessionId
     * @return
     */
    @GetMapping("/newest")
    public Result getNewestBotMsg(HttpServletRequest request, String sessionId) {
        if (Objects.isNull(chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, sessionId)
                .eq(ChatSession::getUserId, request.getAttribute("userId").toString())))) {
            throw new BizException("您无权访问此会话");
        }
        return Result.buildSuccess(chatSessionService.getNewestBotMsg(sessionId));
    }

    /**
     * 更新会话
     * @param request
     * @param chatSessionDto
     * @return
     */
    @PutMapping
    public Result edit(HttpServletRequest request,
                       @RequestBody ChatSessionDto chatSessionDto) {
        if (Objects.isNull(chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, chatSessionDto.getId())
                .eq(ChatSession::getUserId, request.getAttribute("userId").toString())))) {
            throw new BizException("您无权访问此会话");
        }
        // 清洗数据
        ChatSession chatSession = new ChatSession();
        chatSession.setId(chatSessionDto.getId());
        chatSession.setModelVersionId(chatSessionDto.getModelVersionId());
        chatSession.setRemark(chatSessionDto.getRemark());
        return chatSessionService.updateById(chatSession) ?
                Result.buildSuccess("会话更新成功！") :
                Result.buildFail("会话更新失败！");
    }

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
        return Result.buildSuccess(chatSessionService.getHistoryMsgDetail(sessionId));
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
        // 查询用户ID
        chatSessionDto.setUserId(request.getAttribute("userId").toString());
        // 增加会话
        return chatSessionService.addOne(chatSessionDto) ? Result.buildSuccess(chatSessionDto) : Result.buildFail();
    }
}
