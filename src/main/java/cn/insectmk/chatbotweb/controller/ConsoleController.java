package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.entity.User;
import cn.insectmk.chatbotweb.service.ConsoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

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
    private ConsoleService consoleService;

    /**
     * 分页查询用户
     * @param userQueryPageBean
     * @return
     */
    @PostMapping("/find/user")
    public Result findUsers(@RequestBody QueryPageBean<User> userQueryPageBean) {
        return Result.buildSuccess(consoleService.findUsers(userQueryPageBean));
    }
}
