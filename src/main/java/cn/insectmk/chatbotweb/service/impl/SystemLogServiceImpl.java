package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.mapper.SystemLogMapper;
import cn.insectmk.chatbotweb.service.SystemLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
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
}
