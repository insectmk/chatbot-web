package cn.insectmk.chatbotweb.interceptor;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.util.JWTUtil;
import cn.insectmk.chatbotweb.util.JsonUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @Description 登录拦截
 * @Author makun
 * @Date 2024/02/27 19:54
 * @Version 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Autowired
    private JWTUtil jwtUtil;
    @Autowired
    private JsonUtil jsonUtil;

    /**
     * 在调用controller之前会调用此方法
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        try {
            String token = request.getHeader("token");
            if (token == null) {
                token = request.getParameter("token");
            }

            if (StringUtils.isNotBlank(token)) {
                Claims claims = jwtUtil.checkJWT(token);
                if (claims == null) {
                    sendJsonMsg(response, Result.buildFail("登录失败，请重新登录！"));
                    return false;
                } else {
                    request.setAttribute("userId", claims.get("id"));
                    return true;
                }
            }
            sendJsonMsg(response, Result.buildFail("未登录，请先登录!"));
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private void sendJsonMsg(HttpServletResponse response, Object object) {
        try {
            response.setContentType("application/json;charset=utf-8");
            PrintWriter writer = response.getWriter();
            writer.print(jsonUtil.toJson(object));
            writer.flush();
            writer.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
    }
}
