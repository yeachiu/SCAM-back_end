package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ActivityLimit extends Schema implements Serializable {
	
	private String aid;	//活动ID
	
	private String gid;	//分组ID
	
	private static final long serialVersionUID = 1L;

}