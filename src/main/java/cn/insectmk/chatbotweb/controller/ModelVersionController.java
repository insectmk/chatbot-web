package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.service.ModelVersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description 模型版本控制器
 * @Author makun
 * @Date 2024/3/11 10:43
 * @Version 1.0
 */
@RestController
@RequestMapping("/modelVersion")
public class ModelVersionController {
    @Autowired
    private ModelVersionService modelVersionService;

    /**
     * 获取所有的模型
     * @return
     */
    @GetMapping("/all")
    public Result getAll() {
        return Result.buildSuccess(modelVersionService.getAll());
    }
}
