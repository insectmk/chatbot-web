package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.controller.dto.PartnerDto;
import cn.insectmk.chatbotweb.service.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

/**
 * @Description 搭档控制类
 * @Author makun
 * @Date 2024/4/23 11:50
 * @Version 1.0
 */
@RestController
@RequestMapping("/partner")
public class PartnerController {
    @Autowired
    private PartnerService partnerService;

    /**
     * 新增搭档
     * @param partnerDto
     * @param request
     * @return
     */
    @PostMapping
    public Result savePartner(@RequestBody PartnerDto partnerDto, HttpServletRequest request) {
        // 设置用户ID
        partnerDto.setUserId(request.getAttribute("userId").toString());
        // 插入数据
        return partnerService.save(partnerDto) ?
                Result.buildSuccess("新增成功！" , null) :
                Result.buildFail("新增失败！");
    }

    /**
     * 获取公共的搭档
     * @return
     */
    @GetMapping("/public")
    public Result getPublicPartner() {
        return Result.buildSuccess(partnerService.getPublicPartners());
    }

    /**
     * 根据用户ID获取该用户所有的搭档
     * @param request
     * @return
     */
    @GetMapping
    public Result getUserPartner(HttpServletRequest request) {
        return Result.buildSuccess(partnerService.getUserPartners(request.getAttribute("userId").toString()));
    }
}
