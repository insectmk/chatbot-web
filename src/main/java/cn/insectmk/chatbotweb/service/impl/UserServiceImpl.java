package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.configure.value.AliyunOSSConfigValue;
import cn.insectmk.chatbotweb.configure.value.SystemValue;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.ModelVersion;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.ModelVersionMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @Description 用户服务接口实现
 * @Author makun
 * @Date 2024/2/26 16:02
 * @Version 1.0
 */
@Service
@Transactional
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
    @Autowired
    private JWTUtil jwtUtil;
    @Autowired
    private ChatSessionMapper chatSessionMapper;
    @Autowired
    private ChatSessionService chatSessionService;
    @Autowired
    private EmailUtil emailUtil;
    @Autowired
    private AliyunOSSUtil aliyunOSSUtil;
    @Autowired
    private AliyunOSSConfigValue aliyunOSSConfigValue;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private HttpServletRequest httpServletRequest;
    @Autowired
    private SystemValue systemValue;
    @Autowired
    private AESUtil aesUtil;
    @Autowired
    private ModelVersionMapper modelVersionMapper;

    @Override
    public boolean updateOne(UserDto userDto) {
        // 更新信息
        if (StringUtils.isNotBlank(userDto.getEmail())) {
            userDto.setEmail(userDto.getEmail());
        }
        if (StringUtils.isNotBlank(userDto.getUsername())) {
            userDto.setUsername(userDto.getUsername());
        }
        if (StringUtils.isNotBlank(userDto.getPassword())) {
            userDto.setPassword(userDto.getPassword());
        }
        // 判断是否上传了头像
        if (!Objects.isNull(userDto.getIsUploadHead()) && userDto.getIsUploadHead()) {
            // 查询用户旧信息
            User userOld = baseMapper.selectById(userDto.getId());
            // 删除旧头像
            try {
                aliyunOSSUtil.delete(aliyunOSSConfigValue.getPathUserHead(), aliyunOSSUtil.getFileNameByURL(userOld.getHead()));
            } catch (Exception ignored) {
                // 创建日志
                SystemLog systemLog = new SystemLog();
                systemLog.setLevel(SystemLog.LEVEL_WARNING);
                systemLog.setMessage("用户旧头像删除失败，可能是不存在");
                systemLogService.addOne(systemLog);
            }
            // 获取缓存URL
            String userHeadKey = "user:head:" + httpServletRequest.getAttribute("userId");
            // 上传新头像
            userDto.setHead(FileUrlCatchUtil.get(userHeadKey));
            FileUrlCatchUtil.delete(userHeadKey); // 删除元素
        }
        return baseMapper.updateById(userDto) == 1;
    }

    @Override
    public boolean addOne(UserDto userDto) {
        // 创建用户
        userDto.setUsername(userDto.getUsername());
        userDto.setEmail(userDto.getEmail());
        // 判断密码是否为空
        if (StringUtils.isNotBlank(userDto.getPassword())) {
            userDto.setPassword(userDto.getPassword());
        } else {
            // 默认密码
            userDto.setPassword(systemValue.getDefaultPassword());
        }
        // 判断是否上传了头像
        if (!Objects.isNull(userDto.getIsUploadHead()) && userDto.getIsUploadHead()) {
            // 获取缓存URL
            String userHeadKey = "user:head:" + httpServletRequest.getAttribute("userId");
            // 上传新头像
            userDto.setHead(FileUrlCatchUtil.get(userHeadKey));
            FileUrlCatchUtil.delete(userHeadKey); // 删除元素
        }
        baseMapper.insert(userDto);
        // 生成APIKey
        this.getApiKey(userDto.getId());
        return true;
    }

    @Override
    public boolean updatePassword(String userId, String password) {
        User user = baseMapper.selectById(userId);
        if (user.getPassword().equals(password)) {
            // 如果重复则报错
            throw new BizException("新密码不能与旧密码相同");
        }
        user.setPassword(password);
        return 1 == baseMapper.updateById(user);
    }

    @Override
    public boolean deleteOne(String userId) {
        // 删除所有的会话
        for(String sessionId : chatSessionService
                .getAllChatSession(userId)
                .stream()
                .map(ChatSession::getId)
                .collect(Collectors.toList())) {
            chatSessionService.deleteById(sessionId);
        }
        // 删除用户
        return baseMapper.deleteById(userId) == 1;
    }

    @Override
    public User getUserInfo(String userId) {
        User user = baseMapper.selectById(userId);
        user.setId(null);
        user.setUsername(user.getUsername());
        user.setEmail(user.getEmail());
        user.setPassword(null);
        user.setApiKey(user.getApiKey());
        return user;
    }

    @Override
    public User register(String key) {
        // 解析key
        UserDto userDto = aesUtil.decrypt(key, UserDto.class);
        // 判断是否失效
        if (System.currentTimeMillis() > userDto.getExpiration()) {
            throw new BizException("该注册链接已失效！");
        }
        // 创建用户
        userDto.setHead(systemValue.getDefaultHead());
        baseMapper.insert(userDto);
        // 生成APIKey
        this.getApiKey(userDto.getId());
        return userDto;
    }

    @Override
    public boolean sendRegisterUrl(UserDto userDto) {
        // 查询邮箱是否注册
        if (!Objects.isNull(baseMapper.selectOne(new LambdaQueryWrapper<User>().eq(User::getEmail, userDto.getEmail())))) {
            throw new BizException("该邮箱已注册，请返回登录！");
        }
        // 设置失效时间
        userDto.setExpiration(System.currentTimeMillis() + (5 * 60 * 1000));
        // 加密
        String url = systemValue.getUrl() + "/user/register" + "?key=" + aesUtil.encrypt(userDto);
        // 发送邮件
        emailUtil.sendHtmlMail(userDto.getEmail(),
                "智能聊天机器人注册链接",
                "【智能聊天机器人】:</br>" +
                        "感谢您选择InsectMk的智能聊天机器人，请在【5分钟】内<a href ='" + url + "'>点击此链接</a>完成注册");
        return true;
    }

    @Override
    public String getApiKey(String userId) {
        // 获取用户信息
        User user = baseMapper.selectById(userId);
        // 如果生成过APIKey则删除会话
        if (StringUtils.isNotBlank(user.getApiKey())) {
            // 解密APIKey
            String sessionId = user.getApiKey();
            // 删除会话内容
            chatSessionService.deleteById(sessionId);
        }
        // 找到第一个模型
        ModelVersion modelVersion = modelVersionMapper
                .selectOne(new QueryWrapper<ModelVersion>()
                        .last("LIMIT 1"));
        // 创建一个会话
        ChatSession chatSession = new ChatSession();
        chatSession.setUserId(userId);
        chatSession.setModelVersionId(modelVersion.getId());
        chatSession.setRemark("[" + user.getUsername() + "]的API");
        chatSessionMapper.insert(chatSession);
        // 生成key
        String key = chatSession.getId();
        user.setApiKey(aesUtil.encrypt(key));
        baseMapper.updateById(user);

        return key;
    }

    @Override
    public boolean isTokenEffective(String token) {
        if (Objects.isNull(jwtUtil.checkJWT(token))) return false;
        Object userId = jwtUtil.checkJWT(token).get("userId");
        return !Objects.isNull(userId) && !Objects.isNull(baseMapper.selectById(userId.toString()));
    }

    @Override
    public String login(String email, String password) {
        User user = baseMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, email)
                .eq(User::getPassword, password));
        // 邮箱与密码是否匹配
        if (Objects.isNull(user)) {
            return null;
        }
        // 更新最后登录时间
        user.setLastLoginTime(new Date());
        baseMapper.updateById(user);
        // 生成JWT
        return jwtUtil.generateJWT(user);
    }

    @Override
    public IPage<User> findUsersPage(QueryPageBean userQueryPageBean) {
        String queryString = userQueryPageBean.getQueryString();
        LambdaQueryWrapper<User> userQueryWrapper = null;
        // 查询条件
        if (StringUtils.isNotBlank(queryString)) {
            userQueryWrapper = new LambdaQueryWrapper<User>()
                    // 判断用户名是否模糊匹配
                    .like(User::getUsername, queryString)
                    .or()
                    // 判断邮箱是否模糊匹配
                    .like(User::getEmail, queryString);
        }
        // 查询
        return baseMapper.selectPage(
                new Page<>(userQueryPageBean.getCurrentPage(), userQueryPageBean.getPageSize()),
                userQueryWrapper);
    }

    @Override
    public boolean isTokenRoot(String token) {
        if (isTokenEffective(token)) {
            User user = baseMapper.selectById(jwtUtil.checkJWT(token).get("userId").toString());
            return systemValue.getRootEmail().contains(user.getEmail());
        }
        return false;
    }
}
