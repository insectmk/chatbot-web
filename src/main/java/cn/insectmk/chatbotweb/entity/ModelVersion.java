package cn.insectmk.chatbotweb.entity;

import cn.insectmk.chatbotweb.util.RegularUtil;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.Pattern;
import java.util.Date;

/**
 * @Description 模型版本
 * @Author makun
 * @Date 2024/2/25 16:06
 * @Version 1.0
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ModelVersion {
    protected String id;
    protected String name;
    protected String versionNumber;
    @Pattern(regexp = RegularUtil.API_URL, message = "接口格式不正确")
    protected String apiHost;
    protected String apiKey;
    protected Double temperature;
    protected Double topP;
    protected Double presencePenalty;
    protected Double frequencyPenalty;
    protected Integer maxToken;
    protected Long generateTokens;
    protected Date deploymentTime;
    protected String remark;
}
