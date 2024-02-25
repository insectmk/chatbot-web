package cn.insectmk.chatbotweb.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;

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
    public enum Level {
        INFO("信息"), WARNING("警告"), ERROR("错误");

        final String level;

        Level(String level) {
            this.level = level;
        }

        @Override
        public String toString() {
            return this.level;
        }
    }

    private Integer id;
    private Level level;
    private String message;
    private Timestamp createTime;
}
