package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ModelRateDto;
import cn.insectmk.chatbotweb.service.ModelRateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 模型评分控制类
 * @Author makun
 * @Date 2024/4/24 13:35
 * @Version 1.0
 */
@RestController
@RequestMapping("/modelRate")
public class ModelRateController {
    @Autowired
    private ModelRateService modelRateService;

    /**
     * 添加模型评价
     * @param modelRateDto
     * @param request
     * @return
     */
    @PostMapping
    public Result save(@RequestBody ModelRateDto modelRateDto,
                       HttpServletRequest request) {
        return modelRateService.saveOne(modelRateDto, request.getAttribute("userId").toString()) ?
                Result.buildSuccess("评价成功！", null) :
                Result.buildFail("评价失败！");
    }
}
