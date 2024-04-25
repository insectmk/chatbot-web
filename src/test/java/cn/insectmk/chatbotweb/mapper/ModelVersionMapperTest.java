package cn.insectmk.chatbotweb.mapper;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.Date;

@SpringBootTest
class ModelVersionMapperTest {
    @Autowired
    private ModelVersionMapper modelVersionMapper;

    @Test
    void getModelRateByDayMonth() {
        Float modelRateByDay = modelVersionMapper.getModelRateByDay("1", new Date());
        System.out.println(modelRateByDay);
    }
}
