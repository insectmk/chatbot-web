package cn.insectmk.chatbotweb.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @Description Json工具
 * @Author makun
 * @Date 2024/02/27 20:18
 * @Version 1.0
 */
public class JsonUtil {
    @Autowired
    private ObjectMapper objectMapper;

    /**
     * 将对象转换为Json字符串
     * @param object
     * @return
     */
    public String toJson(Object object) {
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            return null;
        }
    }
}
