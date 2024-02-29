package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.ChatMessageDto;
import cn.insectmk.chatbotweb.controller.dto.HttpApiRequestDto;
import cn.insectmk.chatbotweb.controller.vo.HttpApiResponseVo;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatMessageMapper;
import cn.insectmk.chatbotweb.service.ChatGlmService;
import cn.insectmk.chatbotweb.service.ChatMessageService;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * @Description 聊天消息服务接口实现
 * @Author makun
 * @Date 2024/2/26 15:52
 * @Version 1.0
 */
@Service
@Transactional
public class ChatMessageServiceImpl extends ServiceImpl<ChatMessageMapper, ChatMessage> implements ChatMessageService {
    @Autowired
    private ChatGlmService chatGlmService;
    @Autowired
    private ChatSessionService chatSessionService;

    @Override
    public HttpApiResponseVo send(ChatMessageDto chatMessageDto) {
        // 判断当前会话是否在生成
        ChatSession chatSession = chatSessionService.getOne(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getId, chatMessageDto.getSessionId()));
        if (chatSession.getStatus().equals(ChatSession.STATUS_BUSY)) {
            throw new BizException("当前会话正忙");
        }
        // 更换状态
        chatSession.setStatus(ChatSession.STATUS_BUSY);
        chatSessionService.updateById(chatSession);
        // 查询所有的对话
        ArrayList<String[]> dialogs = chatSessionService.getHistoryMessageBySessionId(chatSession.getId());
        // 进行对话
        HttpApiResponseVo response = chatGlmService.send(new HttpApiRequestDto(
                chatMessageDto.getMessageContent(),
                dialogs
        ));
        // 存储用户新对话
        ChatMessage userChatMessage = new ChatMessage(null, chatSession.getId(),
                ChatMessage.SENDER_TYPE_USER, null,
                chatMessageDto.getMessageContent(),
                null);
        baseMapper.insert(userChatMessage);
        // 存储机器人新对话
        ChatMessage botChatMessage = new ChatMessage(null, chatSession.getId(),
                ChatMessage.SENDER_TYPE_BOT,
                userChatMessage.getId(),
                response.getResponse(),
                null);
        baseMapper.insert(botChatMessage);
        // 更新对话状态
        chatSession.setStatus(ChatSession.STATUS_FREE);
        chatSessionService.updateById(chatSession);

        return response;
    }
}
