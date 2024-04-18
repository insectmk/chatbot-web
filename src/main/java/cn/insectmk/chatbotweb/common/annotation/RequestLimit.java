package cn.insectmk.chatbotweb.common.annotation;

import java.lang.annotation.*;

/**
 * @Description: 请求限制的自定义注解
 * @Author: makun
 * @Date:   2024/4/10 10:57
 * @Version: V1.0
 */
@Documented
@Inherited
@Target({ElementType.METHOD,ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface RequestLimit {
    // 在 second 秒内，最大只能请求 maxCount 次
    int second() default 1;
    int maxCount() default 1;
}
