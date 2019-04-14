package cn.licoy.wdog.core.vo.app;

import com.baomidou.mybatisplus.annotations.TableField;
import lombok.Data;

@Data
public class GroupVO {

    private String id;

    private Integer period;	//年级，为null表示为专业分组

    private Integer whatClass;	//

    private String className;   //班级名称

    private String institute;   //学院名称

    private String profession;   //专业名称
}
