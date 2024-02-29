package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.ChatMessageDto;
import cn.insectmk.chatbotweb.controller.vo.HttpApiResponseVo;
import cn.insectmk.chatbotweb.entity.ChatMessage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description 聊天消息服务接口
 * @Author makun
 * @Date 2024/2/26 15:48
 * @Version 1.0
 */
public interface ChatMessageService extends IService<ChatMessage> {
    /**
     * 发送消息
     * @param chatMessageDto
     * @return
     */
    HttpApiResponseVo send(ChatMessageDto chatMessageDto);
}
