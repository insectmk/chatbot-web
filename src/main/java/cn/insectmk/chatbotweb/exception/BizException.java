package cn.insectmk.chatbotweb.exception;

import lombok.NoArgsConstructor;

/**
 * @Description 业务异常
 * @Author makun
 * @Date 2023/9/15 10:21
 * @Version 1.0
 */
@NoArgsConstructor
public class BizException extends RuntimeException {
    public BizException(String msg) {
        super(msg);
    }
}
