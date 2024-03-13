package cn.insectmk.chatbotweb.exception;

import cn.insectmk.chatbotweb.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@RestControllerAdvice //控制层通知类
@Slf4j
public class ExceptionCatch {
    /**
     * 数据库异常捕获
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(SQLException.class)
    public Result sqlException(SQLException ex, HttpServletRequest request, HttpServletResponse response) {
        setHeader(request, response);

        return Result.buildFail("数据不符合规范：" + ex.getCause());
    }

    /**
     * 业务异常捕获
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(BizException.class)
    public Result bizEx(BizException ex, HttpServletRequest request, HttpServletResponse response) {
        setHeader(request, response);

        log.error("出现了业务异常 ==> "+ ex);
        return Result.buildFail("原因：" + ex.getMessage());
    }

    //运行时异常捕获
    @ExceptionHandler(RuntimeException.class)
    public Result runtimeEx(RuntimeException ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);

        log.error("出现了RuntimeException ==> "+ ex);
        return Result.buildFail("出错了：" + ex.getCause());
    }

    //空指针时异常捕获
    @ExceptionHandler(NullPointerException.class)
    public Result runtimeEx(NullPointerException ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);

        log.error("出现了NullPointerException ==> "+ ex);
        return new Result(false,"非法数据，请重新输入" ,null);
    }

    //异常捕获
    @ExceptionHandler(Exception.class)
    public Result runtimeEx(Exception ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);

        log.error("出现了Exception ==> "+ ex);
        return Result.buildFail("服务器出错：" + ex.getMessage());
    }


    /**
     * 设置请求头、响应头
     * @param request
     * @param response
     */
    private void setHeader(HttpServletRequest request, HttpServletResponse response) {
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT,PATCH, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");
    }
}
