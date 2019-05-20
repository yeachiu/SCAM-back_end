package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GroupUser extends Schema implements Serializable {
	
	private String uid;	//
	
	private String gid;	//
	
	private Integer isAdmin;	//
	
	private static final long serialVersionUID = 1L;

}