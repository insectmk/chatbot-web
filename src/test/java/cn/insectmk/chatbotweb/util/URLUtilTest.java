package cn.insectmk.chatbotweb.util;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class URLUtilTest {
    @Autowired
    private URLUtil urlUtil;

    @Test
    void isUrlOnline() {
        boolean urlOnline = urlUtil.isUrlOnline("http://rwkv.frp.insectmk.top");
        System.out.println(urlOnline);
    }
}
