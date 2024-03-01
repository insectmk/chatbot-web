package cn.insectmk.chatbotweb.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

/**
 * 封装返回结果
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Result implements Serializable{
    public static final String MSG_SUCCESS = "执行成功";
    public static final String MSG_FAIL = "执行失败";

    private boolean flag;//执行结果，true为执行成功 false为执行失败
    private String message;//返回结果信息
    private Object data;//返回数据

    /**
     * 快速构建成功消息
     * @param msg
     * @return
     */
    public static Result buildSuccess(String msg) {
        return new Result(true, msg, null);
    }

    /**
     * 快速构建失败消息
     * @return
     */
    public static Result buildFail() {
        return new Result(false, MSG_FAIL);
    }

    /**
     * 快速构建失败消息
     * @param message
     * @return
     */
    public static Result buildFail(String message) {
        return new Result(false, message);
    }

    /**
     * 快速构建不带返回数据的成功消息
     * @return
     */
    public static Result buildSuccess() {
        return new Result(true, MSG_SUCCESS);
    }

    /**
     * 快速构建成功消息
     * @param data
     * @return
     */
    public static Result buildSuccess(Object data) {
        return new Result(true, MSG_SUCCESS, data);
    }

    public Result(boolean flag, String message) {
        super();
        this.flag = flag;
        this.message = message;
    }
}
