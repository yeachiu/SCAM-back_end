package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Group extends Schema implements Serializable {
	
	private String name;	//
	
	private Integer typeSymbol;	//0：用户分组；1：部门分组
	
	private String dictId;	//字典表代码，如学院、专业
	
	private Integer period;	//年级，为null表示为专业分组
	
	private Integer classNum;	//
	
	private Integer whatClass;	//
	
	private String apartmentId;	//部门ID
	
	private static final long serialVersionUID = 1L;

}