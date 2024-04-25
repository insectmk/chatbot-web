package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.controller.dto.ModelRateDto;
import cn.insectmk.chatbotweb.entity.ModelRate;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.mapper.ModelRateMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ModelRateService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description 模型评分服务接口实现类
 * @Author makun
 * @Date 2024/4/24 13:32
 * @Version 1.0
 */
@Service
public class ModelRateServiceImpl extends ServiceImpl<ModelRateMapper, ModelRate> implements ModelRateService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean saveOne(ModelRateDto modelRateDto, String userId) {
        User user = userMapper.selectById(userId);
        modelRateDto.setUserId(userId);
        modelRateDto.setUsername(user.getUsername());
        return save(modelRateDto);
    }
}
