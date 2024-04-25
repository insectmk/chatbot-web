package cn.insectmk.chatbotweb.service;

import java.util.List;
import java.util.Map;

/**
 * @Description 后台服务接口
 * @Author makun
 * @Date 2024/4/8 14:41
 * @Version 1.0
 */
public interface ConsoleService {
    /**
     * 获取模型统计数据
     * @return
     */
    Map<String, List<?>> getModelUsageStatistic();

    /**
     * 获取模型最近7天的评分情况，按天结算
     * @return
     */
    Map<String, List<?>> getModelRateStatistic();
}
