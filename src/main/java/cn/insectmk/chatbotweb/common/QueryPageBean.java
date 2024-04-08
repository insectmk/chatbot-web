package cn.insectmk.chatbotweb.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @Description 分页查询条件
 * @Author makun
 * @Date 2024/4/8 14:45
 * @Version 1.0
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QueryPageBean {
    private Integer currentPage;//页码
    private Integer pageSize;//每页记录数
    private String queryString;//查询条件
}
