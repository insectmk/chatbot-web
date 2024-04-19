package cn.insectmk.chatbotweb.common.aspect;

import cn.insectmk.chatbotweb.configure.value.SystemValue;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.exception.BizException;
import cn.insectmk.chatbotweb.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 保存业务日志切面
 * @Author makun
 * @Date 2024/4/8 10:57
 * @Version 1.0
 */
@Aspect
@Component
@Slf4j
public class AuthorityAspect {
    @Autowired
    private HttpServletRequest httpServletRequest;
    @Autowired
    private SystemValue systemValue;
    @Autowired
    private UserService userService;

    @Around("execution(* cn.insectmk.chatbotweb.controller.ConsoleController.*(..))")
    @Transactional
    public Object aroundExecution(ProceedingJoinPoint joinPoint) throws Throwable  {
        User user = userService.getById(httpServletRequest.getAttribute("userId").toString());
        if (systemValue.getRootEmail().contains(user.getEmail())) {
            return joinPoint.proceed();
        }
        throw new BizException("您不是root用户");
    }
}
