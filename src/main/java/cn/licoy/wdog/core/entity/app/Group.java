package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Group extends Schema implements Serializable {
	
	private String dictId;	//字典表代码，如学院、专业、年级、班级
	
	private String name;	//
	
	private static final long serialVersionUID = 1L;

}