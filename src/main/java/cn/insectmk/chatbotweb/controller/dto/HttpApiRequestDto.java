package cn.insectmk.chatbotweb.controller.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;

/**
 * @Description HTTP接口请求数据
 * @Author makun
 * @Date 2024/2/29 8:50
 * @Version 1.0
 */

@NoArgsConstructor
@AllArgsConstructor
@Data
public class HttpApiRequestDto {
    private String prompt;
    // 历史消息：[["你好","你好👋！我是人工智能助手 ChatGLM2-6B，很高兴见到你，欢迎问我任何问题。"]]
    private ArrayList<String[]> history;
}
