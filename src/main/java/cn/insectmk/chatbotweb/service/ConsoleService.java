package cn.insectmk.chatbotweb.service;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.entity.User;
import com.baomidou.mybatisplus.core.metadata.IPage;

import java.util.List;

/**
 * @Description 后台服务接口
 * @Author makun
 * @Date 2024/4/8 14:41
 * @Version 1.0
 */
public interface ConsoleService {
    /**
     * 根据查询条件分页查询用户
     * @param userQueryPageBean
     * @return
     */
    IPage<User> findUsers(QueryPageBean<User> userQueryPageBean);
}
