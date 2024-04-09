package cn.insectmk.chatbotweb.common.annotation;

import java.lang.annotation.*;

/**
 * @Description: 保存业务日志，在Controller中使用，在方法上定义
 * @Author: makun
 * @Date:   2024/4/8 10:57
 * @Version: V1.0
 */
@Retention(RetentionPolicy.RUNTIME)
@Target({ElementType.METHOD})
@Documented
public @interface BizLog {
    /**
     * 日志等级
     * @return
     */
    String level();

    /**
     * 日志消息
     */
    String message();
}
