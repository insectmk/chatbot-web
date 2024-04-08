package cn.insectmk.chatbotweb.configure;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

/**
 * @Description 权限控制
 * @Author makun
 * @Date 2024/4/8 9:53
 * @Version 1.0
 */
@Configuration
public class WebSecurityConfig {
    public final static String ACCOUNT_CLIENT_AUTHORITY = "admin";

    //配置basicauth账号密码
    @Bean
    InMemoryUserDetailsManager userDetailsService() {
        return new InMemoryUserDetailsManager();
    }
    //配置不同接口访问权限
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        return http
                .authorizeRequests().antMatchers("/api/**",
                        "/chatMessage/**",
                        "/chatSession/**",
                        "/login/**",
                        "/modelVersion/**",
                        "/user/**").permitAll()
                .antMatchers("/pri/**").hasAuthority(ACCOUNT_CLIENT_AUTHORITY).anyRequest().authenticated()
                .and()
                .httpBasic()
                .and()
                .csrf()
                .disable()
                .build();
    }
}
