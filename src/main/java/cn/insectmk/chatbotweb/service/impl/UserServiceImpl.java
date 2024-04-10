package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.configure.value.AliyunOSSConfigValue;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.*;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
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
    @Value(("${server.address}"))
    private String ip;
    @Value("${server.port}")
    private String port;

    @Autowired
    private AESUtil aesUtil;
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
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private AliyunOSSConfigValue aliyunOSSConfigValue;
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private HttpServletRequest httpServletRequest;

    @Override
    public boolean updateOne(UserDto userDto) {
        // 更新信息
        if (StringUtils.isNotBlank(userDto.getEmail())) {
            userDto.setEmail(aesUtil.encrypt(userDto.getEmail()));
        }
        if (StringUtils.isNotBlank(userDto.getUsername())) {
            userDto.setUsername(aesUtil.encrypt(userDto.getUsername()));
        }
        if (StringUtils.isNotBlank(userDto.getPassword())) {
            userDto.setPassword(aesUtil.encrypt(userDto.getPassword()));
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
        userDto.setUsername(aesUtil.encrypt(userDto.getUsername()));
        userDto.setEmail(aesUtil.encrypt(userDto.getEmail()));
        // 判断密码是否为空
        if (StringUtils.isNotBlank(userDto.getPassword())) {
            userDto.setPassword(aesUtil.encrypt(userDto.getPassword()));
        } else {
            // 默认密码
            userDto.setPassword(aesUtil.encrypt("&123456InsectMk"));
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
        if (aesUtil.decrypt(user.getPassword()).equals(password)) {
            // 如果重复则报错
            throw new BizException("新密码不能与旧密码相同");
        }
        user.setPassword(aesUtil.encrypt(password));
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
        user.setUsername(aesUtil.decrypt(user.getUsername()));
        user.setEmail(aesUtil.decrypt(user.getEmail()));
        user.setPassword(null);
        user.setApiKey(user.getApiKey());
        return user;
    }

    @Override
    public User register(String key) {
        // 解析key，（用户名+邮箱+密码+失效时间）
        String[] split = aesUtil.decrypt(key).split("\\\\");
        // 判断是否失效
        if (System.currentTimeMillis() > Long.parseLong(split[3])) {
            throw new BizException("该注册链接已失效！");
        }
        // 创建用户
        User user = new User();
        user.setHead("https://insectmk.cn/static/img/head/insectmk.png");
        user.setUsername(aesUtil.encrypt(split[0]));
        user.setEmail(aesUtil.encrypt(split[1]));
        user.setPassword(aesUtil.encrypt(split[2]));
        baseMapper.insert(user);
        // 生成APIKey
        this.getApiKey(user.getId());
        return user;
    }

    @Override
    public boolean sendRegisterUrl(UserDto userDto) {
        // 拼接参数（用户名+邮箱+密码+失效时间）
        String source = userDto.getUsername() + "\\" + userDto.getEmail() + "\\" + userDto.getPassword() + "\\" + (System.currentTimeMillis() + (5 * 60 * 1000));
        // 加密
        String url = "http://" + ip + ":" + port + "/user/register" + "?key=" + aesUtil.encrypt(source);
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
            String sessionId = aesUtil.decrypt(user.getApiKey());
            // 删除会话内容
            chatSessionService.deleteById(sessionId);
        }
        // 创建一个会话
        ChatSession chatSession = new ChatSession(
                null, userId, null,
                "[" + aesUtil.decrypt(user.getUsername()) + "]的API",
                null, null
        );
        chatSessionMapper.insert(chatSession);
        // 生成key
        String key = aesUtil.encrypt(chatSession.getId());
        user.setApiKey(key);
        baseMapper.updateById(user);

        return key;
    }

    @Override
    public boolean isTokenEffective(String token) {
        return !Objects.isNull(jwtUtil.checkJWT(token));
    }

    @Override
    public String login(String email, String password) {
        User user = baseMapper.selectOne(new LambdaQueryWrapper<User>()
                .eq(User::getEmail, aesUtil.encrypt(email))
                .eq(User::getPassword, aesUtil.encrypt(password)));
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
                    // 判断用户名是否等于
                    .eq(User::getUsername, aesUtil.encrypt(queryString))
                    .or()
                    // 判断邮箱是否等于
                    .eq(User::getEmail, aesUtil.encrypt(queryString));
        }
        // 查询
        Page<User> userPage = baseMapper.selectPage(
                new Page<>(userQueryPageBean.getCurrentPage(), userQueryPageBean.getPageSize()),
                userQueryWrapper);
        // 解密数据
        userPage.getRecords().forEach(user -> {
            user.setEmail(aesUtil.decrypt(user.getEmail()));
            user.setUsername(aesUtil.decrypt(user.getUsername()));
        });
        return userPage;
    }
}
