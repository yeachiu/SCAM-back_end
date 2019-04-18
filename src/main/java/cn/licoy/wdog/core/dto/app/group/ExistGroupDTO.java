package cn.licoy.wdog.core.dto.app.group;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class ExistGroupDTO {

    @NotBlank(message = "所属学院/专业不能为空")
    private String dictId;	//字典表代码，如学院、专业


    private Integer period;	//年级，为null表示为专业分组


    private Integer whatClass;	//
}
