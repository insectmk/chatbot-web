package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.ModelRateDto;
import cn.insectmk.chatbotweb.controller.dto.PartnerRateDto;
import cn.insectmk.chatbotweb.service.ModelRateService;
import cn.insectmk.chatbotweb.service.PartnerRateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 搭档评分控制类
 * @Author makun
 * @Date 2024/4/24 13:35
 * @Version 1.0
 */
@RestController
@RequestMapping("/partnerRate")
public class PartnerRateController {
    @Autowired
    private PartnerRateService partnerRateService;

    /**
     * 添加搭档评价
     * @param partnerRateDto
     * @param request
     * @return
     */
    @PostMapping
    public Result save(@RequestBody PartnerRateDto partnerRateDto,
                       HttpServletRequest request) {
        return partnerRateService.saveOne(partnerRateDto, request.getAttribute("userId").toString()) ?
                Result.buildSuccess("评价成功！", null) :
                Result.buildFail("评价失败！");
    }
}
