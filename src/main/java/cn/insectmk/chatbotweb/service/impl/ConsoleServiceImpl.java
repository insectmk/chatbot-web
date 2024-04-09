package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.EChartsPieDate;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.service.ConsoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        ArrayList<EChartsPieDate> modelEChartsPieDates = new ArrayList<>();
        // 查询所有的模型
        List<ModelVersion> modelVersions = modelVersionMapper.selectList(null);
        // 遍历所有套餐并装载数据
        for (ModelVersion modelVersion : modelVersions) {
            modelNames.add(modelVersion.getName());
            modelEChartsPieDates.add(new EChartsPieDate(modelVersion.getName(), modelVersion.getGenerateTokens()));
        }
        // 将数据装载到返回对象中
        HashMap<String, List<?>> result = new HashMap<>();
        result.put("modelNames", modelNames);
        result.put("modelEChartsPieDates", modelEChartsPieDates);
        return result;
    }
}
