package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ConsoleService;
import cn.insectmk.chatbotweb.util.AESUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @Description 后台服务接口实现类
 * @Author makun
 * @Date 2024/4/8 14:41
 * @Version 1.0
 */
@Service
public class ConsoleServiceImpl implements ConsoleService {
    @Autowired
    private UserMapper userMapper;
    @Autowired
    private AESUtil aesUtil;

    @Override
    public IPage<User> findUsers(QueryPageBean<User> userQueryPageBean) {
        Page<User> userPage = userMapper.selectPage(
                new Page<>(userQueryPageBean.getCurrentPage(), userQueryPageBean.getPageSize()),
                new LambdaQueryWrapper<User>()
                        // 判断用户名是否等于
                        .eq(StringUtils.isNotBlank(userQueryPageBean.getQueryEntity().getUsername()), User::getUsername, aesUtil.encrypt(userQueryPageBean.getQueryEntity().getUsername()))
                        // 判断邮箱是否等于
                        .eq(StringUtils.isNotBlank(userQueryPageBean.getQueryEntity().getEmail()), User::getEmail, aesUtil.encrypt(userQueryPageBean.getQueryEntity().getEmail())));
        // 解密数据
        userPage.getRecords().forEach(user -> {
            user.setEmail(aesUtil.decrypt(user.getEmail()));
            user.setUsername(aesUtil.decrypt(user.getUsername()));
        });
        return userPage;
    }

    private String processUsername(String username) {
        // 对username进行处理，比如添加前后缀或者转换大小写
        return "%" + username.toUpperCase() + "%";
    }
}
