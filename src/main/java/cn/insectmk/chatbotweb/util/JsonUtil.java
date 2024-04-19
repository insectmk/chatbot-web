package cn.insectmk.chatbotweb.util;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @Description Json工具
 * @Author makun
 * @Date 2024/02/27 20:18
 * @Update 2024/04/19 20:18
 * @Version 2.0
 */
@Component
@Slf4j
public class JsonUtil {
    @Autowired
    private ObjectMapper objectMapper;

    /**
     * 将JSON字符串转为对象，处理失败返回空对象
     * @param json 需要处理的JSON字符串
     * @param objectClass
     * @return
     * @param <T>
     */
    public <T> T toObject(String json, Class<T> objectClass) {
        try {
            return objectMapper.readValue(json, objectClass);
        } catch (JsonProcessingException e) {
            log.error("Json处理异常：", e);
        }
        return null;
    }

    /**
     * 将对象转换为Json字符串
     * @param object
     * @return
     */
    public String toJson(Object object) {
        try {
            return objectMapper.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            log.error("Json处理异常：", e);
        }
        return null;
    }
}
