package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.Partner;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatMessageMapper;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.PartnerMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.plexpt.chatgpt.entity.chat.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @Description 会话服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:00
 * @Version 1.0
 */
@Service
@Transactional
public class ChatSessionServiceImpl extends ServiceImpl<ChatSessionMapper, ChatSession> implements ChatSessionService {
    @Autowired
    private ChatMessageMapper chatMessageMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private PartnerMapper partnerMapper;

    @Override
    public List<Message> getHistoryMsg(String sessionId) {
        return baseMapper.selectHistoryMsg(sessionId);
    }

    @Override
    public boolean deleteById(String sessionId) {
        // 删除历史消息
        chatMessageMapper.delete(new LambdaQueryWrapper<ChatMessage>()
                .eq(ChatMessage::getSessionId, sessionId));
        // 删除会话
        return baseMapper.deleteById(sessionId) == 1;
    }

    @Override
    public List<ChatSession> getAllChatSession(String userId) {
        return baseMapper.selectList(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getUserId, userId)
                .orderByDesc(ChatSession::getEndTime));
    }

    @Override
    public boolean addOne(ChatSessionDto chatSessionDto) {
        // 获取用户信息
        User user = userMapper.selectById(chatSessionDto.getUserId());
        // 判断会话是否达到限制
        Integer sessionCnt = baseMapper.selectCount(new LambdaQueryWrapper<ChatSession>()
                .eq(ChatSession::getUserId, user.getId()));
        if (user.getMaxSession() <= sessionCnt) {
            throw new BizException("已达到最大会话数");
        }
        // 添加会话
        save(chatSessionDto);
        // 增加搭档提示词消息
        Partner partner = partnerMapper.selectById(chatSessionDto.getPartnerId());
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setSessionId(chatSessionDto.getId());
        chatMessage.setSenderType(ChatMessage.SENDER_TYPE_SYSTEM);
        chatMessage.setMessageContent(partner.getPrompt());
        chatMessageMapper.insert(chatMessage);
        return true;
    }
}
