package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.ChatMessage;

/**
 * @Description OpenAI式API服务接口
 * @Author makun
 * @Date 2024/3/5 10:26
 * @Version 1.0
 */
public interface OpenaiApiService {
    /**
     * 向OpenAI API接口发送消息并得到回复
     * @param chatMessage
     * @return
     */
    String send(ChatMessage chatMessage);
}
