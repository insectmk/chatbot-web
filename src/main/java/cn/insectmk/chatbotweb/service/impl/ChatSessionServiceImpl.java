package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.ChatSessionDto;
import cn.insectmk.chatbotweb.entity.*;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatMessageMapper;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.PartnerMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.ModelVersionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.plexpt.chatgpt.entity.chat.Message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Date;
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
    @Autowired
    private ModelVersionService modelVersionService;

    @Override
    public List<ChatMessage> getHistoryMsgDetail(String sessionId) {
        return baseMapper.selectHistoryMsgDetail(sessionId);
    }

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
        String partnerId = chatSessionDto.getPartnerId();
        if (StringUtils.isNotBlank(partnerId)) {
            Partner partner = partnerMapper.selectById(partnerId);
            ChatMessage chatMessage = new ChatMessage();
            chatMessage.setSessionId(chatSessionDto.getId());
            chatMessage.setSenderType(ChatMessage.SENDER_TYPE_SYSTEM);
            chatMessage.setMessageContent(partner.getPrompt());
            chatMessageMapper.insert(chatMessage);
        }
        return true;
    }

    @Override
    public ChatMessage getNewestBotMsg(String sessionId) {
        return chatMessageMapper.selectOne(new LambdaQueryWrapper<ChatMessage>()
                .eq(ChatMessage::getSessionId, sessionId)
                .eq(ChatMessage::getSenderType, ChatMessage.SENDER_TYPE_ASSISTANT)
                .orderByDesc(ChatMessage::getSentTime)
                .last("limit 1"));
    }

    @Override
    public String createByDialogFile(MultipartFile file, String userId) {
        // 获取默认模型
        ModelVersion defaultModel = modelVersionService.getDefaultModel();
        // 创建会话
        ChatSessionDto chatSessionDto = new ChatSessionDto();
        chatSessionDto.setUserId(userId);
        chatSessionDto.setRemark("导入的对话");
        chatSessionDto.setModelVersionId(defaultModel.getId());
        addOne(chatSessionDto);
        try {
            // 转将消息文件为对象
            List<ChatMessage> chatMessages = extractDialogues(file);
            // 遍历插入
            String userMessageIdTemp = null;
            String senderType;
            long time = 0;
            for (ChatMessage chatMessage : chatMessages) {
                senderType = chatMessage.getSenderType();
                // 设置会话ID
                chatMessage.setSessionId(chatSessionDto.getId());
                // 设置发送时间（从0时间戳开始，加1小时，解决聊天的顺序问题）
                time += 3600000;
                chatMessage.setSentTime(new Date(time));

                switch (senderType) {
                    case ChatMessage.SENDER_TYPE_USER:
                        chatMessageMapper.insert(chatMessage);
                        userMessageIdTemp = chatMessage.getId();
                        break;
                    case ChatMessage.SENDER_TYPE_ASSISTANT:
                        chatMessage.setMessageId(userMessageIdTemp);
                        chatMessageMapper.insert(chatMessage);
                        break;
                    case ChatMessage.SENDER_TYPE_SYSTEM:
                        chatMessageMapper.insert(chatMessage);
                        break;
                }
            }
        } catch (IOException e) {
            throw new BizException("对话格式不正确，请使用导出的对话格式！");
        }

        return chatSessionDto.getId();
    }

    /**
     * 将对话txt转为消息对象
     * @param file
     * @return
     * @throws IOException
     */
    private List<ChatMessage> extractDialogues(MultipartFile file) throws IOException {
        List<ChatMessage> dialogues = new ArrayList<>();
        String currentType = null;
        StringBuilder contentBuilder = new StringBuilder();

        try (InputStreamReader isr = new InputStreamReader(file.getInputStream());
             BufferedReader reader = new BufferedReader(isr)) {
            String line;
            ChatMessage chatMessage;
            while ((line = reader.readLine()) != null) {
                if (line.startsWith("system:")) {
                    if (currentType != null) {
                        chatMessage = new ChatMessage();
                        chatMessage.setSenderType(currentType);
                        chatMessage.setMessageContent(contentBuilder.toString().trim());
                        dialogues.add(chatMessage);
                        contentBuilder = new StringBuilder();
                    }
                    currentType = ChatMessage.SENDER_TYPE_SYSTEM;
                    contentBuilder.append(line.substring(7));
                } else if (line.startsWith("user:")) {
                    if (currentType != null) {
                        chatMessage = new ChatMessage();
                        chatMessage.setSenderType(currentType);
                        chatMessage.setMessageContent(contentBuilder.toString().trim());
                        dialogues.add(chatMessage);
                        contentBuilder = new StringBuilder();
                    }
                    currentType = ChatMessage.SENDER_TYPE_USER;
                    contentBuilder.append(line.substring(5));
                } else if (line.startsWith("assistant:")) {
                    if (currentType != null) {
                        chatMessage = new ChatMessage();
                        chatMessage.setSenderType(currentType);
                        chatMessage.setMessageContent(contentBuilder.toString().trim());
                        dialogues.add(chatMessage);
                        contentBuilder = new StringBuilder();
                    }
                    currentType = ChatMessage.SENDER_TYPE_ASSISTANT;
                    contentBuilder.append(line.substring(10));
                } else if (currentType != null) {
                    // 如果当前行不属于任何发送者，但它前面有内容，那么它是多行内容的一部分
                    contentBuilder.append("\n").append(line);
                }
            }
            // 添加最后一个Dialogue对象
            if (currentType != null) {
                chatMessage = new ChatMessage();
                chatMessage.setSenderType(currentType);
                chatMessage.setMessageContent(contentBuilder.toString().trim());
                dialogues.add(chatMessage);
            }
        }

        return dialogues;
    }
}
