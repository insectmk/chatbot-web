package cn.insectmk.chatbotweb.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description 装载一次对话
 * @Author makun
 * @Date 2024/2/29 11:28
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Dialog {
    private String userMessage;
    private String botMessage;

    /**
     * 将对象的字段转换为数组的元素
     * @return
     */
    public String[] convertToArray() {
        return new String[]{getUserMessage(), getBotMessage()};
    }
}
