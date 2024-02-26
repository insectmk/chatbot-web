package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.service.EmailService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EmailServiceImplTest {
    @Autowired
    private EmailService emailService;

    @Test
    void sendMail() {
        emailService.sendMail("2514378105@qq.com", "测试邮件", "你好啊，这是一封测试邮件");
    }
}
