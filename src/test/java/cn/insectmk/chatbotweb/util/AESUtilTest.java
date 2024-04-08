package cn.insectmk.chatbotweb.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AESUtilTest {
    @Autowired
    private AESUtil aesUtil;

    @Test
    void encrypt() throws Exception {
        String content = "bdcbaddba6c97171726cf56b8dd1d4e1";
        String key = "";
        System.out.println("原文=" + content);
        String s1 = aesUtil.encrypt(content, key);
        System.out.println("加密结果=" + s1);
        System.out.println("解密结果="+aesUtil.decrypt(s1, key));
    }

    @Test
    void decrypt() {
        String content = "my/bnohoTSX+w4CNocpXCqHXu6gOYSwqEXHBxTZnnQQ=";
        System.out.println(aesUtil.decrypt(content));
    }
}
