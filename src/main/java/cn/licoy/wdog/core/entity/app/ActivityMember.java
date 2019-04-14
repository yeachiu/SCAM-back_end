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
public class ActivityMember extends Schema implements Serializable {
	
	private String actiId;	//
	
	private String uid;	//
	
	private Boolean checkin;	//签到管理
	
	private static final long serialVersionUID = 1L;

}