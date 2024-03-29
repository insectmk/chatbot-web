package cn.insectmk.chatbotweb.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class EmailUtilTest {
    @Autowired
    private EmailUtil emailUtil;

    @Test
    void sendMail() {
        emailUtil.sendSimpleMail("makun_ing@126.com", "测试邮件2024/02/10", "https://insectmk.cn");
    }
}
