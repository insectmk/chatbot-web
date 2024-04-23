package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.Partner;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Description 搭档服务接口
 * @Author makun
 * @Date 2024/4/23 9:41
 * @Version 1.0
 */
public interface PartnerService extends IService<Partner> {
    /**
     * 获取用户所有的搭档
     * @param userId
     * @return
     */
    List<Partner> getUserPartners(String userId);
}
