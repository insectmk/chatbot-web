package cn.insectmk.chatbotweb.exception;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.service.SystemLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.stream.Collectors;

@RestControllerAdvice //控制层通知类
@Slf4j
public class ExceptionCatch {
    @Autowired
    private SystemLogService systemLogService;

    /**
     * 数据校验异常捕获
     * @param ex
     * @param request
     * @param response
     * @return
     */
    @ExceptionHandler(MethodArgumentNotValidException.class)
    public Result methodArgumentNotValidException(MethodArgumentNotValidException ex, HttpServletRequest request, HttpServletResponse response) {
        setHeader(request, response);
        log.info("数据校验失败：", ex);
        // 消息
        String message = "数据校验失败：" + ex.getBindingResult()
                .getAllErrors()
                .stream()
                .map(DefaultMessageSourceResolvable::getDefaultMessage)
                .collect(Collectors.joining(";"));
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_WARNING);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
        return Result.buildFail(message);
    }

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
        log.error("数据不符合规范：", ex);
        // 消息
        String message = "数据不符合规范：" + ex.getCause();
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_ERROR);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
        return Result.buildFail(message);
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
        log.info("业务异常：", ex);

        // 消息
        String message = "业务异常：" + ex.getMessage();
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_WARNING);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
        return Result.buildFail(message);
    }

    //运行时异常捕获
    @ExceptionHandler(RuntimeException.class)
    public Result runtimeEx(RuntimeException ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);
        log.error("运行时异常：", ex);
        // 消息
        String message = "出错了：" + ex.getCause();
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_ERROR);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
        return Result.buildFail(message);
    }

    //空指针时异常捕获
    @ExceptionHandler(NullPointerException.class)
    public Result runtimeEx(NullPointerException ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);
        log.error("空指针异常：", ex);
        // 消息
        String message = "非法数据：" + ex.getMessage();
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_ERROR);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
        return new Result(false,"非法数据，请重新输入" ,null);
    }

    //异常捕获
    @ExceptionHandler(Exception.class)
    public Result runtimeEx(Exception ex, HttpServletRequest request, HttpServletResponse response){
        setHeader(request, response);
        log.error("Exception：", ex);
        // 消息
        String message = "服务器出错：" + ex.getMessage();
        // 写入日志
        SystemLog systemLog = new SystemLog();
        systemLog.setLevel(SystemLog.LEVEL_ERROR);
        systemLog.setMessage(message);
        systemLogService.addOne(systemLog);
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
