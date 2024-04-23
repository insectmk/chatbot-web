package cn.insectmk.chatbotweb.controller;

import cn.insectmk.chatbotweb.common.Result;
import cn.insectmk.chatbotweb.service.PartnerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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
