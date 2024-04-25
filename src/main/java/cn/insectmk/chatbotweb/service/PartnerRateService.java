package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.controller.dto.PartnerRateDto;
import cn.insectmk.chatbotweb.entity.PartnerRate;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description 搭档评分服务接口
 * @Author makun
 * @Date 2024/4/24 14:15
 * @Version 1.0
 */
public interface PartnerRateService extends IService<PartnerRate> {
    /**
     * 新增一个搭档评价
     * @param partnerRateDto
     * @param userId
     * @return
     */
    boolean saveOne(PartnerRateDto partnerRateDto, String userId);
}
