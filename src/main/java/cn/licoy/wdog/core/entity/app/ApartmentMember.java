package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ApartmentMember extends Schema implements Serializable {
	
	private String aparId;	//
	
	private String uid;	//
	
	private Integer isadmin;	//部门管理员
	
	private static final long serialVersionUID = 1L;

}
