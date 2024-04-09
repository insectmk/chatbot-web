package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.configure.CustomerSystemConfigValue;
import cn.insectmk.chatbotweb.service.ConsoleService;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.service.UserService;
import cn.insectmk.chatbotweb.util.AESUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description 后台功能控制
 * @Author makun
 * @Date 2024/4/8 14:37
 * @Version 1.0
 */
@RestController
@RequestMapping("/console")
public class ConsoleController {
    @Autowired
    private UserService userService;
    @Autowired
    private SystemLogService systemLogService;

    /**
     * 查询日志列表
     * @param queryPageBean
     * @return
     */
    @GetMapping("/systemLog")
    public Result findSystemLogs(QueryPageBean queryPageBean) {
        return Result.buildSuccess(systemLogService.findUsersPage(queryPageBean));
    }

    /**
     * 分页查询用户
     * @param queryPageBean
     * @return
     */
    @GetMapping("/user")
    public Result findUsers(QueryPageBean queryPageBean) {
        return Result.buildSuccess(userService.findUsersPage(queryPageBean));
    }
}
