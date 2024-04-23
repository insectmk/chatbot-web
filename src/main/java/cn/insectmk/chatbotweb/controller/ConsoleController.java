package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.QueryPageBean;
import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.common.annotation.BizLog;
import cn.insectmk.chatbotweb.controller.dto.ModelVersionDto;
import cn.insectmk.chatbotweb.controller.dto.UserDto;
import cn.insectmk.chatbotweb.entity.SystemLog;
import cn.insectmk.chatbotweb.service.*;
import cn.insectmk.chatbotweb.util.AliyunOSSUtil;
import cn.insectmk.chatbotweb.util.FileUrlCatchUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private ModelVersionService modelVersionService;
    @Autowired
    private ConsoleService consoleService;
    @Autowired
    private AliyunOSSUtil aliyunOSSUtil;
    @Autowired
    private PartnerService partnerService;

    /**
     * 分页条件查询搭档
     * @param queryPageBean
     * @return
     */
    @GetMapping("/partner")
    public Result findPartner(QueryPageBean queryPageBean) {
        return Result.buildSuccess(partnerService.findPartnersPage(queryPageBean));
    }

    /**
     * 用户头像上传
     * @param file
     * @return
     */
    @PostMapping("/user/head")
    public Result userHeadUpload(MultipartFile file, HttpServletRequest httpServletRequest) {
        String url = aliyunOSSUtil.upload(file, aliyunOSSUtil.getPathUserHead());
        // 确保文件不为空
        if (file.isEmpty()) {
            return Result.buildFail("文件不能为空");
        }
        // 创建图片缓存key
        String userHeadKey = "user:head:" + httpServletRequest.getAttribute("userId");
        // 将文件字节数组存入缓存
        FileUrlCatchUtil.set(userHeadKey, url);
        return Result.buildSuccess("文件缓存成功", null);
    }

    /**
     * 获取模型使用率统计
     * @return
     */
    @GetMapping("/statistic/modelUsage")
    public Result statisticModelUsage() {
        Map<String, List<?>> result = consoleService.getModelUsageStatistic();
        return Result.buildSuccess(result);
    }

    /**
     * 删除模型
     * @param id
     * @return
     */
    @DeleteMapping("/model")
    public Result deleteModel(String id) {
        return modelVersionService.deleteOne(id) ?
                Result.buildSuccess("删除成功！", null) :
                Result.buildFail("删除失败！");
    }

    /**
     * 更新模型
     * @param modelVersionDto
     * @return
     */
    @PutMapping("/model")
    public Result updateUser(@RequestBody ModelVersionDto modelVersionDto) {
        return modelVersionService.updateOne(modelVersionDto) ?
                Result.buildSuccess("更新成功！", null) :
                Result.buildFail("更新失败！");
    }

    /**
     * 添加模型
     * @param modelVersionDto
     * @return
     */
    @PostMapping("/model")
    public Result addModel(@Valid @RequestBody ModelVersionDto modelVersionDto) {
        return modelVersionService.addOne(modelVersionDto) ?
                Result.buildSuccess("新增成功！", null) :
                Result.buildFail("新增失败！");
    }

    /**
     * 分页条件查询模型数据
     * @param queryPageBean
     * @return
     */
    @GetMapping("/model")
    public Result findModel(QueryPageBean queryPageBean) {
        return Result.buildSuccess(modelVersionService.findModelsPage(queryPageBean));
    }

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
    public Result updateUser(@Valid @RequestBody UserDto userDto) {
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
        return Result.buildSuccess(systemLogService.findSystemLogsPage(queryPageBean));
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
