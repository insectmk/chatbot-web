package cn.insectmk.chatbotweb.mapper;

import cn.insectmk.chatbotweb.entity.ModelVersion;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;
import java.util.Date;

/**
 * @Description 模型版本表映射
 * @Author makun
 * @Date 2024/2/25 17:16
 * @Version 1.0
 */
public interface ModelVersionMapper extends BaseMapper<ModelVersion> {
    /**
     * 获取模型某天的评分情况
     * @param modelId
     * @param date
     * @return
     */
    Float getModelRateByDay(@Param("modelId") String modelId, @Param("date")Date date);
}
