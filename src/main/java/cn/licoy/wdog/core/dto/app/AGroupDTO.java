package cn.licoy.wdog.core.dto.app;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class AGroupDTO {
    @NotBlank(message = "分组名称不能为空")
    private String name;

    @NotBlank(message = "所属学院/专业不能为空")
    private String dictId;	//字典表代码，如学院、专业

    @NotBlank(message = "年级不能为空")
    private Integer period;	//年级，为null表示为专业分组

    @NotBlank(message = "班级数不能为空")
    private Integer classNum;	//
}
