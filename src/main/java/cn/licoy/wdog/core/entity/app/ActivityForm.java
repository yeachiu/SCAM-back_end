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
public class ActivityForm extends Schema implements Serializable {
	
	private String activityId;	//活动表外键
	
	private String rules;	//表单规则
	
	private String status;	//状态
	
	private static final long serialVersionUID = 1L;

}