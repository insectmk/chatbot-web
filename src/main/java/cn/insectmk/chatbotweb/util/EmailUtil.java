package cn.insectmk.chatbotweb.util;

import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * @Description 邮件发送接口实现类
 * @Author makun
 * @Date 2024/2/26 17:37
 * @Version 1.0
 */
@Log4j2
@Component
public class EmailUtil {
    @Value("${spring.mail.username}")
    private String username;

    @Autowired
    private JavaMailSender javaMailSender;

    /**
     * 发送HTML消息
     * @param to
     * @param subject
     * @param body
     */
    public void sendHtmlMail(String to, String subject, String body) {
        try {
            MimeMessage mimeMessage = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "GBK");
            helper.setFrom(username);
            helper.setTo(to);
            helper.setSubject(subject);
            // 启用html
            helper.setText(body, true);
            javaMailSender.send(mimeMessage);
            log.info("发送邮件，接收email = {}, msg= {}", to, body);
        } catch (MessagingException e) {
            log.error("发送邮件时发生异常:[{}],错误:[{}]", e.getMessage(), e);
        }
    }

    /**
     * 发送邮件
     * @param to 发送给谁
     * @param subject 标题
     * @param body 内容
     */
    public void sendSimpleMail(String to, String subject, String body) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(username);
        message.setTo(to);
        message.setSubject(subject);
        message.setText(body);

        javaMailSender.send(message);
    }
}
