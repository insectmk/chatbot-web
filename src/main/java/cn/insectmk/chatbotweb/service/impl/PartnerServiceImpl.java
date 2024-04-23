package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.controller.dto.PartnerDto;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.entity.Partner;
import cn.insectmk.chatbotweb.mapper.PartnerMapper;
import cn.insectmk.chatbotweb.service.PartnerService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Description 搭档接口实现类
 * @Author makun
 * @Date 2024/4/23 9:41
 * @Version 1.0
 */
@Service
public class PartnerServiceImpl extends ServiceImpl<PartnerMapper, Partner> implements PartnerService {
    @Override
    public List<Partner> getUserPartners(String userId) {
        return baseMapper.selectList(new LambdaQueryWrapper<Partner>()
                .eq(Partner::getUserId, userId));
    }

    @Override
    public List<Partner> getPublicPartners() {
        return baseMapper.selectList(new LambdaQueryWrapper<Partner>()
                .eq(Partner::getIsPublic, true));
    }

    @Override
    public boolean deleteOneByUserId(String partnerId, String userId) {
        return baseMapper.delete(new LambdaQueryWrapper<Partner>()
                .eq(Partner::getId, partnerId)
                .eq(Partner::getUserId, userId)) == 1;
    }

    @Override
    public boolean updateOneByUserId(PartnerDto partnerDto, String userId) {
        Partner partner = baseMapper.selectById(partnerDto.getId());
        if (!partner.getUserId().equals(userId)) {
            return false;
        }
        partnerDto.setUserId(null);
        return baseMapper.updateById(partnerDto) == 1;
    }

    @Override
    public IPage<Partner> findPartnersPage(QueryPageBean queryPageBean) {
        String queryString = queryPageBean.getQueryString();
        LambdaQueryWrapper<Partner> partnerLambdaQueryWrapper = null;
        // 查询条件
        if (StringUtils.isNotBlank(queryString)) {
            partnerLambdaQueryWrapper = new LambdaQueryWrapper<Partner>()
                    // 模糊查询搭档名称
                    .like(Partner::getName, queryString);
        }
        // 查询
        return baseMapper.selectPage(
                new Page<>(queryPageBean.getCurrentPage(), queryPageBean.getPageSize()),
                partnerLambdaQueryWrapper);
    }
}
