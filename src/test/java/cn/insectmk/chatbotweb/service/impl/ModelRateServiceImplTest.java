package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.ModelRateDto;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.service.ModelRateService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Calendar;
import java.util.Date;
import java.util.Random;

@SpringBootTest
class ModelRateServiceImplTest {
    @Autowired
    private ModelRateService modelRateService;
    @Autowired
    private ModelVersionMapper modelVersionMapper;

    @Test
    void saveOne() {
        ModelRateDto modelRateDto;
        for (int i = 0; i <= 1000; i++) {
            // 创建一个Calendar实例
            Calendar calendar = Calendar.getInstance();
            // 获取当前日期
            calendar.getTime();
            // 设置calendar为30天前
            calendar.add(Calendar.DAY_OF_MONTH, -29);
            // 获取30天前的日期
            calendar.getTime();
            // 创建一个Random对象来生成随机数
            Random random = new Random();
            // 生成一个随机数，代表从30天前到今天之间的天数
            int randomDays = random.nextInt(30) + 1;
            // 将这个随机数加到30天前的日期上
            calendar.add(Calendar.DAY_OF_MONTH, randomDays);
            // 获取随机日期
            Date randomDate = calendar.getTime();
            modelRateDto = new ModelRateDto();
            modelRateDto.setRate(new Random().nextInt(1));
            modelRateDto.setModelVersionId("6c8e08ea4324ef0bbcd13bcf651682ce");
            modelRateDto.setComment("测试数据，自动生成");
            modelRateDto.setCreateTime(randomDate);
            modelRateService.saveOne(modelRateDto, "faecf96a4a822452df162b566f8f27fd");
        }
    }
}
