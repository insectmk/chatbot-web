package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.PartnerRateDto;
import cn.insectmk.chatbotweb.entity.PartnerRate;
import cn.insectmk.chatbotweb.mapper.PartnerRateMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.PartnerRateService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description 搭档评分服务接口实现类
 * @Author makun
 * @Date 2024/4/24 14:16
 * @Version 1.0
 */
@Service
public class PartnerRateServiceImpl extends ServiceImpl<PartnerRateMapper, PartnerRate> implements PartnerRateService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean saveOne(PartnerRateDto partnerRateDto, String userId) {
        partnerRateDto.setUsername(userMapper.selectById(userId).getUsername());
        partnerRateDto.setUserId(userId);
        return save(partnerRateDto);
    }
}
