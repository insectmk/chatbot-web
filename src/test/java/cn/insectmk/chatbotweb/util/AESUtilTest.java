package cn.insectmk.chatbotweb.util;

import cn.insectmk.chatbotweb.common.echarts.PieData;
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
        PieData eChartsPieData = new PieData("测试", 999L);
        String encrypt = aesUtil.encrypt(eChartsPieData);
        System.out.println(encrypt);
        PieData decrypt = aesUtil.decrypt(encrypt, PieData.class);
        System.out.println(decrypt);
    }

    @Test
    void testEncrypt() {
    }

}
