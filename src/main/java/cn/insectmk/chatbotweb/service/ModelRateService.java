package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.ModelRateDto;
import cn.insectmk.chatbotweb.entity.ModelRate;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description 模型评分服务接口
 * @Author makun
 * @Date 2024/4/24 13:31
 * @Version 1.0
 */
public interface ModelRateService extends IService<ModelRate> {
    /**
     * 添加评价
     * @param modelRateDto
     * @param userId
     * @return
     */
    boolean saveOne(ModelRateDto modelRateDto, String userId);
}
