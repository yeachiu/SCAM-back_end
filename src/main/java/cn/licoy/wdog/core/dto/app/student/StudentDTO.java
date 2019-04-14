package cn.licoy.wdog.core.dto.app.student;

import lombok.Data;

@Data
public class StudentDTO {

    private String realName;	//

    private String stuNum;	//

    private String className;	//对应AGroup.name

    private String dictId;	//字典表代码，如学院、专业

    private Integer period;	//年级，为null表示为专业分组

    private Integer whatClass;	//
}
