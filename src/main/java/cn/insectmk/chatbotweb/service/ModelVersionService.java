package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.entity.ModelVersion;
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
     * 获取所有的模型
     * @return
     */
    List<ModelVersion> getAll();
}
