package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.entity.SystemLog;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * @Description 系统日志服务接口
 * @Author makun
 * @Date 2024/2/26 15:49
 * @Version 1.0
 */
public interface SystemLogService extends IService<SystemLog> {
    /**
     * 条件分页查询日志
     * @param queryPageBean
     * @return
     */
    IPage<SystemLog> findUsersPage(QueryPageBean queryPageBean);
}
