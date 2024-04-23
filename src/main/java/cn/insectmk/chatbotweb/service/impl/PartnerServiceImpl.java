package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.Partner;
import cn.insectmk.chatbotweb.mapper.PartnerMapper;
import cn.insectmk.chatbotweb.service.PartnerService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
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
}
