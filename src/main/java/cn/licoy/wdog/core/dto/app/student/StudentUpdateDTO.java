package cn.licoy.wdog.core.dto.app.student;

import cn.licoy.wdog.core.vo.app.GroupVO;
import lombok.Data;

@Data
public class StudentUpdateDTO {

//    private GroupVO groupVO;
//    private String className;   //班级
//    private String institute;   //学院
//    private String profession;  //专业
//    private Integer period;     //年级
//    private Integer whatClass;  //班号

    @NotBlank(message = "姓名不能为空")
    private String realName;	//

    @NotBlank(message = "学号不能为空")
    private String stuNum;	//

    @NotBlank(message = "请选择一个专业")
    private String dictId;	//字典表代码，如学院、专业

    private Integer period;	//年级，为null表示为专业分组

    private Integer whatClass;	//

}
