package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.controller.dto.ModelVersionDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.ModelVersionService;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @Description 模型版本服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:01
 * @Version 1.0
 */
@Service
@Transactional
public class ModelVersionServiceImpl extends ServiceImpl<ModelVersionMapper, ModelVersion> implements ModelVersionService {
    @Autowired
    private ChatSessionMapper chatSessionMapper;

    @Override
    public List<ModelVersion> getAll() {
        return baseMapper.selectList(null);
    }

    @Override
    public IPage<ModelVersion> findModelsPage(QueryPageBean queryPageBean) {
        String queryString = queryPageBean.getQueryString();
        LambdaQueryWrapper<ModelVersion> systemLogLambdaQueryWrapper = null;
        // 查询条件
        if (StringUtils.isNotBlank(queryString)) {
            systemLogLambdaQueryWrapper = new LambdaQueryWrapper<ModelVersion>()
                    // 模糊查询模型名称
                    .like(ModelVersion::getName, queryString)
                    .or()
                    // 模糊查询模型备注
                    .like(ModelVersion::getRemark, queryString);
        }
        // 查询
        return baseMapper.selectPage(
                new Page<>(queryPageBean.getCurrentPage(), queryPageBean.getPageSize()),
                systemLogLambdaQueryWrapper);
    }

    @Override
    public boolean addOne(ModelVersionDto modelVersionDto) {
        return save(modelVersionDto);
    }

    @Override
    public boolean updateOne(ModelVersionDto modelVersionDto) {
        return updateById(modelVersionDto);
    }

    @Override
    public boolean deleteOne(String id) {
        try {
            // 找到数据库中第一个模型
            ModelVersion modelVersion = baseMapper
                    .selectOne(new QueryWrapper<ModelVersion>()
                            .last("LIMIT 1"));
            // 更新被影响的会话到新模型
            ChatSession chatSession = new ChatSession();
            chatSession.setModelVersionId(modelVersion.getId());
            chatSessionMapper.update(chatSession, new LambdaQueryWrapper<ChatSession>()
                    .eq(ChatSession::getModelVersionId, id));
            // 删除模型
            return removeById(id);
        } catch (Exception e) {
            throw new BizException("该模型为默认模型，无法删除！");
        }
    }
}
