package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.controller.dto.PartnerDto;
import cn.insectmk.chatbotweb.entity.Partner;
import com.baomidou.mybatisplus.core.metadata.IPage;
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

    /**
     * 获取所有的公共搭档
     * @return
     */
    List<Partner> getPublicPartners();

    /**
     * 判断搭档是否为该用户的，如果是则删除
     * @param partnerId
     * @param userId
     * @return
     */
    boolean deleteOneByUserId(String partnerId, String userId);

    /**
     * 更新搭档信息
     * @param partnerDto
     * @param userId
     * @return
     */
    boolean updateOneByUserId(PartnerDto partnerDto, String userId);

    /**
     * 分页查询搭档
     * @param queryPageBean
     * @return
     */
    IPage<Partner> findPartnersPage(QueryPageBean queryPageBean);

    /**
     * 新增搭档
     * @param partnerDto
     * @param userId
     * @return
     */
    boolean saveOne(PartnerDto partnerDto, String userId);
}
