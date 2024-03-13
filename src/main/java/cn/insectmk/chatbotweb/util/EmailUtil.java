package cn.insectmk.chatbotweb.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

/**
 * @Description 邮件发送接口实现类
 * @Author makun
 * @Date 2024/2/26 17:37
 * @Version 1.0
 */
public class EmailUtil {
    @Value("${spring.mail.username}")
    private String username;

    @Autowired
    private JavaMailSender javaMailSender;

    /**
     * 发送邮件
     * @param to 发送给谁
     * @param subject 标题
     * @param body 内容
     */
    public void sendMail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(username);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);

        javaMailSender.send(message);
    }
}
