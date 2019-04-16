package cn.licoy.wdog.core.dto.app.group;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class AGroupUpdateDTO {

    @NotBlank(message = "分组ID不能为空")
    private String id;

    private Integer period;	//年级，为null表示为专业分组

    private Integer whatClass;	//

    private String className;   //班级名称

    private String institute;   //学院名称

    private String profession;   //专业名称
}
