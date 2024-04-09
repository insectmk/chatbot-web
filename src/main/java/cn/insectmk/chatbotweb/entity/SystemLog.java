package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

/**
 * @Description 日志
 * @Author makun
 * @Date 2024/2/25 16:01
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class SystemLog {
    public static final String LEVEL_INFO = "信息";
    public static final String LEVEL_WARNING = "警告";
    public static final String LEVEL_ERROR = "错误";
    public static final String LEVEL_SUCCESS = "成功";

    protected String id;
    private String opEmail;
    protected String level;
    protected String message;
    protected Date createTime;
}
