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
public class ActivityFormEntry extends Schema implements Serializable {
	
	private String name;	//名称
	
	private String type;	//类型
	
	private String defaultValue;	//默认值
	
	private String remark;	//注释
	
	private Boolean allownull;	//允许空值(0=true;1=false)
	
	private static final long serialVersionUID = 1L;

}