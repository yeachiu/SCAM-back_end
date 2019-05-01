package cn.licoy.wdog.core.service.app.impl;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class FindClazzDTO {

    @NotBlank(message = "专业不能为空")
    private String professionId;

    @NotBlank(message = "年级不能为空")
    private String period;
}