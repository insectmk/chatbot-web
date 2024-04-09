package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.BizLog;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.service.SystemLogService;
import cn.insectmk.chatbotweb.service.UserService;
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
    private UserService userService;
    @Autowired
    private SystemLogService systemLogService;

    /**
     * 清空系统日志
     * @return
     */
    @BizLog(level = SystemLog.LEVEL_INFO, message = "清空系统日志")
    @DeleteMapping("/systemLog")
    public Result deleteSystemLog() {
        return systemLogService.remove(null) ?
                Result.buildSuccess("清空成功", null) :
                Result.buildFail("清空失败！");
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @DeleteMapping("/user")
    public Result deleteUser(String id) {
        return userService.deleteOne(id) ?
                Result.buildSuccess("删除成功！", null) :
                Result.buildFail("删除失败！");
    }

    /**
     * 更新用户
     * @param userDto
     * @return
     */
    @PutMapping("/user")
    public Result updateUser(@RequestBody UserDto userDto) {
        return userService.updateOne(userDto) ?
                Result.buildSuccess("更新成功！", null) :
                Result.buildFail("更新失败！");
    }

    /**
     * 添加用户
     * @param userDto
     * @return
     */
    @PostMapping("/user")
    public Result addUser(@RequestBody UserDto userDto) {
        return userService.addOne(userDto) ?
                Result.buildSuccess("新增成功！", null) :
                Result.buildFail("新增失败！");
    }

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
