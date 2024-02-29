package cn.insectmk.chatbotweb.service.impl;

import cn.insectmk.chatbotweb.entity.ChatSession;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.mapper.ChatSessionMapper;
import cn.insectmk.chatbotweb.mapper.UserMapper;
import cn.insectmk.chatbotweb.service.ChatSessionService;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import cn.insectmk.chatbotweb.util.JWTUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Objects;

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
    private AESUtil aesUtil;
    @Autowired
    private JWTUtil jwtUtil;
    @Autowired
    private ChatSessionMapper chatSessionMapper;
    @Autowired
    private ChatSessionService chatSessionService;

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
                "用户" + user.getUsername() + "的API",
                null, null, ChatSession.STATUS_FREE
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

        if (Objects.isNull(user)) {
            return null;
        }

        return jwtUtil.generateJWT(user);
    }
}
