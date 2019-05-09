package cn.licoy.wdog.core.dto.app.activity;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class CheckinDTO {

    @NotBlank(message = "未获取活动ID标识")
    private String actiId;

    @NotBlank(message = "未获取报名数据")
    private String signupData;
}