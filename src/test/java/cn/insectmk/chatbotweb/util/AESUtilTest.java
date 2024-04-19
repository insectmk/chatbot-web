package cn.insectmk.chatbotweb.util;

import cn.insectmk.chatbotweb.common.EChartsPieDate;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class AESUtilTest {
    @Autowired
    private AESUtil aesUtil;

    @Test
    void encrypt() {
        String encrypt = aesUtil.encrypt("你好啊，这是我的第一条数据");
        System.out.println(encrypt);
        String decrypt = aesUtil.decrypt(encrypt);
        System.out.println(decrypt);
    }

    @Test
    void decrypt() {
    }

    @Test
    void testDecrypt() {
        EChartsPieDate eChartsPieDate = new EChartsPieDate("测试", 999L);
        String encrypt = aesUtil.encrypt(eChartsPieDate);
        System.out.println(encrypt);
        EChartsPieDate decrypt = aesUtil.decrypt(encrypt, EChartsPieDate.class);
        System.out.println(decrypt);
    }

    @Test
    void testEncrypt() {
    }

}
