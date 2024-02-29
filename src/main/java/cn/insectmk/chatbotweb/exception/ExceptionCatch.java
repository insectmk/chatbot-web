package cn.insectmk.chatbotweb.exception;

import cn.insectmk.chatbotweb.common.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RestControllerAdvice //控制层通知类
@Slf4j
public class ExceptionCatch {
    @ExceptionHandler(BizException.class)
    public Result bizEx(RuntimeException ex, HttpServletRequest request, HttpServletResponse response) {
        return Result.buildFail(ex.getMessage());
    }

    //运行时异常捕获
    @ExceptionHandler(RuntimeException.class)
    public Result runtimeEx(RuntimeException ex, HttpServletRequest request, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT,PATCH, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");

        log.error("出现了RuntimeException ==> "+ ex);
        return new Result(false,"服务器繁忙，请稍后重试..." ,null);
    }

    //空指针时异常捕获
    @ExceptionHandler(NullPointerException.class)
    public Result runtimeEx(NullPointerException ex, HttpServletRequest request, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT,PATCH, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");

        log.error("出现了NullPointerException ==> "+ ex);
        return new Result(false,"非法数据，请重新输入" ,null);
    }

    //异常捕获
    @ExceptionHandler(Exception.class)
    public Result runtimeEx(Exception ex, HttpServletRequest request, HttpServletResponse response){
        response.setHeader("Access-Control-Allow-Origin", request.getHeader("origin"));
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Methods", "GET, HEAD, POST, PUT,PATCH, DELETE, OPTIONS");
        response.setHeader("Access-Control-Allow-Headers", "*");

        log.error("出现了Exception ==> "+ ex);
        return new Result(false,"服务器超时，请稍后再试..." ,null);
    }
}
