package cn.licoy.wdog.core.dto.app.student;

import cn.licoy.wdog.core.vo.app.GroupVO;
import lombok.Data;

@Data
public class StudentUpdateDTO {

    private String id;  //student id
    private String realName;    //姓名
    private String stuNum;      //学号

    private GroupVO groupVO;
//    private String className;   //班级
//    private String institute;   //学院
//    private String profession;  //专业
//    private Integer period;     //年级
//    private Integer whatClass;  //班号

}
