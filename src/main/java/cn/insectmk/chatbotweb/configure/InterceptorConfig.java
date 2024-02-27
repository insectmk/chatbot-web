package cn.insectmk.chatbotweb.configure;

import cn.insectmk.chatbotweb.interceptor.CrossInterceptor;
import cn.insectmk.chatbotweb.interceptor.LoginInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @Description 登录拦截
 * @Author makun
 * @Date 2024/02/27 19:54
 * @Version 1.0
 */
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {
    /**
     * 向容器中添加登录验证拦截器
     * @return
     */
    @Bean
    public LoginInterceptor loginInterceptor() {
        return new LoginInterceptor();
    }

    /**
     * 向容器中添加跨域验证拦截器
     * @return
     */
    @Bean
    public CrossInterceptor crossInterceptor() {
        return new CrossInterceptor();
    }

    /**
     * 拦截规则
     * @param registry
     */
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 跨域拦截规则
        registry.addInterceptor(crossInterceptor())
                .addPathPatterns("/**");

        // 登录拦截规则
        registry.addInterceptor(loginInterceptor())
                .addPathPatterns("/**")
                .excludePathPatterns("/user/login","/user/register");
        WebMvcConfigurer.super.addInterceptors(registry);
    }
}
