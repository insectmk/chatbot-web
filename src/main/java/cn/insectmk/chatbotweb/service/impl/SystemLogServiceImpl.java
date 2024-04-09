package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.mapper.SystemLogMapper;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.util.AESUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @Description 系统日志服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:02
 * @Version 1.0
 */
@Service
@Transactional
public class SystemLogServiceImpl extends ServiceImpl<SystemLogMapper, SystemLog> implements SystemLogService {
    @Autowired
    private AESUtil aesUtil;

    @Override
    public IPage<SystemLog> findUsersPage(QueryPageBean queryPageBean) {
        String queryString = queryPageBean.getQueryString();
        LambdaQueryWrapper<SystemLog> systemLogLambdaQueryWrapper = null;
        // 查询条件
        if (StringUtils.isNotBlank(queryString)) {
            systemLogLambdaQueryWrapper = new LambdaQueryWrapper<SystemLog>()
                    // 模糊查询日志等级
                    .like(StringUtils.isNotBlank(queryString), SystemLog::getLevel, aesUtil.encrypt(queryString))
                    .or()
                    // 模糊查询日志信息
                    .like(StringUtils.isNotBlank(queryString), SystemLog::getMessage, aesUtil.encrypt(queryString))
                    .or()
                    // 模糊查询操作人邮箱
                    .like(StringUtils.isNotBlank(queryString), SystemLog::getOpEmail, aesUtil.encrypt(queryString));
        }

        // 查询
        return baseMapper.selectPage(
                new Page<>(queryPageBean.getCurrentPage(), queryPageBean.getPageSize()),
                systemLogLambdaQueryWrapper);
    }
}
