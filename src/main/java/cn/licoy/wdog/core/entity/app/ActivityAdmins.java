package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActivityAdmins extends Schema implements Serializable {
	
	private String activityId;	//
	
	private String userId;	//
	
	private static final long serialVersionUID = 1L;

}