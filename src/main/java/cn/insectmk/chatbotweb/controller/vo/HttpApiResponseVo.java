package cn.insectmk.chatbotweb.controller.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * @Description HTTP接口响应对象
 * @Author makun
 * @Date 2024/2/29 8:57
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class HttpApiResponseVo {
    private String response;
    private ArrayList<String[]> history;
    private Integer status;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date time;
}
