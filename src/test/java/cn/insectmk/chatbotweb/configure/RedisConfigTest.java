package cn.insectmk.chatbotweb.configure;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.RedisTemplate;

@SpringBootTest
class RedisConfigTest {
    @Autowired
    private RedisTemplate redisTemplate;

    @Test
    void redisConnectTest() {
        redisTemplate.opsForValue().set("666", "666");
    }
}
