package cn.licoy.wdog.core.vo.app;

import lombok.Data;

import java.util.List;

@Data
public class GroupSelectVO {

    private String id;

    private String title;   //班级名称

    private List<GroupSelectVO> children;

    private Boolean expand;

    private Boolean selected;


//    private Integer period;	//年级，为null表示为专业分组

//    private String institute;   //学院名称
//
//    private String profession;   //专业名称
}
