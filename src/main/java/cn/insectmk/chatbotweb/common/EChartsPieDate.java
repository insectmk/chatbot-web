package cn.insectmk.chatbotweb.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description ECharts饼图数据格式
 * @Author makun
 * @Date 2024/4/9 15:57
 * @Version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class EChartsPieDate {
    private String name;
    private Long value;
}
