package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.echarts.BumpData;
import cn.insectmk.chatbotweb.common.echarts.PieData;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.service.ConsoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @Description 后台服务接口实现类
 * @Author makun
 * @Date 2024/4/8 14:41
 * @Version 1.0
 */
@Service
public class ConsoleServiceImpl implements ConsoleService {
    @Autowired
    private ModelVersionMapper modelVersionMapper;

    @Override
    public Map<String, List<?>> getModelUsageStatistic() {
        ArrayList<String> modelNames = new ArrayList<>();
        ArrayList<PieData> modelEChartsPieData = new ArrayList<>();
        // 查询所有的模型
        List<ModelVersion> modelVersions = modelVersionMapper.selectList(null);
        // 遍历所有套餐并装载数据
        for (ModelVersion modelVersion : modelVersions) {
            modelNames.add(modelVersion.getName());
            modelEChartsPieData.add(new PieData(modelVersion.getName(), modelVersion.getGenerateTokens()));
        }
        // 将数据装载到返回对象中
        HashMap<String, List<?>> result = new HashMap<>();
        result.put("modelNames", modelNames);
        result.put("modelEChartsPieDates", modelEChartsPieData);
        return result;
    }

    @Override
    public Map<String, List<?>> getModelRateStatistic() {
        Map<String, List<?>> result = new HashMap<>(); // 结果集合
        List<BumpData> series = new ArrayList<>(); // 评分数据
        // 获取需要的评分天（最近30天）
        List<Date> days = new ArrayList<>();
        Calendar calendar = Calendar.getInstance();  // 获取当前日期的Calendar实例
        calendar.add(Calendar.DAY_OF_MONTH, -29); // 设置calendar为30天前
        // 循环添加最近30天的日期到List中
        for (int i = 0; i < 30; i++) {
            // 通过当前日期获取模型的评分情况
            days.add(calendar.getTime());
            // 加上一天
            calendar.add(Calendar.DAY_OF_MONTH, 1);
        }
        // 获取所有的模型
        modelVersionMapper.selectList(null).forEach(modelVersion -> {
            // 查询30天的评分
            List<Float> rates = new ArrayList<>(30);
            for (Date day : days) {
                rates.add(modelVersionMapper.getModelRateByDay(modelVersion.getId(), day));
            }
            BumpData bumpData = new BumpData();
            bumpData.setData(rates);
            bumpData.setName(modelVersion.getName());
            bumpData.setType("line");
            series.add(bumpData);
        });
        // 每天对应的字符串
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd"); // 创建一个SimpleDateFormat对象来格式化日期
        List<String> daysStr = days.stream()
                .map(dateFormat::format)
                .collect(Collectors.toList());
        // 装载数据
        result.put("days", daysStr);
        result.put("series", series);
        return result;
    }
}
