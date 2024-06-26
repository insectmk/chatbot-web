package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.controller.dto.ModelVersionDto;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * @Description 模型版本服务接口
 * @Author makun
 * @Date 2024/2/26 15:49
 * @Version 1.0
 */
public interface ModelVersionService extends IService<ModelVersion> {
    /**
     * 获取默认模型
     * @return
     */
    ModelVersion getDefaultModel();

    /**
     * 获取所有的模型
     * @return
     */
    List<ModelVersion> getAll();

    /**
     * 分页条件查询模型数据
     * @param queryPageBean
     * @return
     */
    IPage<ModelVersion> findModelsPage(QueryPageBean queryPageBean);

    /**
     * 添加一个模型
     * @param modelVersionDto
     * @return
     */
    boolean addOne(ModelVersionDto modelVersionDto);

    /**
     * 更新模型
     * @param modelVersionDto
     * @return
     */
    boolean updateOne(ModelVersionDto modelVersionDto);

    /**
     * 删除模型
     * @param id
     * @return
     */
    boolean deleteOne(String id);

    /**
     * 根据会话ID获取模型信息
     * @param sessionId
     * @return
     */
    ModelVersion getBySessionId(String sessionId);
}
