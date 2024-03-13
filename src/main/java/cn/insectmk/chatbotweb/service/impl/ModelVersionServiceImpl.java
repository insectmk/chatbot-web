package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.service.ModelVersionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description 模型版本服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:01
 * @Version 1.0
 */
@Service
@Transactional
public class ModelVersionServiceImpl extends ServiceImpl<ModelVersionMapper, ModelVersion> implements ModelVersionService {
}
