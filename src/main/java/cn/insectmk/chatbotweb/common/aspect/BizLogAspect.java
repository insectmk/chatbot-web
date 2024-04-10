package cn.insectmk.chatbotweb.common.aspect;

import cn.insectmk.chatbotweb.common.annotation.BizLog;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.*;

/**
 * @Description 保存业务日志切面
 * @Author makun
 * @Date 2024/4/8 10:57
 * @Version 1.0
 */
@Aspect
@Component
@Slf4j
public class BizLogAspect {
    @Autowired
    private SystemLogService systemLogService;
    @Autowired
    private HttpServletRequest httpServletRequest;
    @Autowired
    private UserService userService;
    @Autowired
    private AESUtil aesUtil;

    // 定义切入点，匹配使用BizLog注解的方法
    @Pointcut("@annotation(cn.insectmk.chatbotweb.common.annotation.BizLog)")
    public void pointCut() {}

    @Around("pointCut()")
    @Transactional
    public Object aroundExecution(ProceedingJoinPoint joinPoint) throws Throwable  {
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        Method method = methodSignature.getMethod(); // 获取切入点的方法
        User user = userService.getById(httpServletRequest.getAttribute("userId").toString());// 获取登录的用户
        // 执行被拦截的方法
        Object result = joinPoint.proceed();
        // 创建日志对象
        cn.insectmk.chatbotweb.entity.SystemLog systemLog = new cn.insectmk.chatbotweb.entity.SystemLog();
        BizLog mBizLog =  method.getAnnotation(BizLog.class); // 获取注解对象
        systemLog.setIpAddress(httpServletRequest.getRemoteAddr()); // 设置操作人IP地址
        systemLog.setOpEmail(aesUtil.decrypt(user.getEmail())); // 设置操作人邮箱
        systemLog.setLevel(mBizLog.level()); // 设置日志等级
        systemLog.setMessage(mBizLog.message()); // 设置日志消息
        systemLog.setCreateTime(new Date()); // 设置创建时间
        System.out.println(systemLog);
        systemLogService.save(systemLog); // 保存日志对象
        return result;
    }
}
