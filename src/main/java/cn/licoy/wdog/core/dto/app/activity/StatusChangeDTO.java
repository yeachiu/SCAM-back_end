package cn.licoy.wdog.core.dto.app.activity;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class StatusChangeDTO {

    @NotBlank(message = "活动标识ID不能为空")
    private String aid;

    @NotBlank(message = "状态代码不能为空")
    private Integer status;
}
