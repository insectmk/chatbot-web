package cn.insectmk.chatbotweb.service;

import org.springframework.stereotype.Service;

/**
 * @Description 邮件发送服务接口
 * @Author makun
 * @Date 2024/2/26 17:36
 * @Version 1.0
 */
@Service
public interface EmailService {
    /**
     * 发送邮件
     * @param to 发送给谁
     * @param subject 标题
     * @param body 内容
     */
    void sendMail(String to, String subject, String body);
}

