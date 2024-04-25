package cn.insectmk.chatbotweb.common.echarts;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

/**
 * @Description ECharts凹凸图数据
 * @Author makun
 * @Date 2024/4/25 10:40
 * @Version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BumpData {
    private List<Float> data;
    private String name;
    private String type = "line";
}
