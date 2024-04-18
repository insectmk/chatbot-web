package cn.insectmk.chatbotweb.util;

import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description 文件缓存工具
 * @Author makun
 * @Date 2024/4/10 15:53
 * @Version 1.0
 */
public class FileUrlCatchUtil {
    private static final Map<String, String> DATA = new HashMap<>();

    /**
     * 删除元素
     * @param key
     * @return
     */
    public static String delete(String key) {
        return DATA.remove(key);
    }

    /**
     * 获取文件
     * @param key
     * @return
     */
    public static String get(String key) {
        return DATA.get(key);
    }

    /**
     * 存文件
     * @param key
     * @param url
     */
    public static void set(String key, String url) {
        DATA.put(key, url);
    }

    private FileUrlCatchUtil(){}
}
