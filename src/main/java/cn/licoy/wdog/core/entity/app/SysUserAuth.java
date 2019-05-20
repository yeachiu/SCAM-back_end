package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysUserAuth extends Schema implements Serializable {
	
	private String uid;	//
	
	private String realName;	//
	
	private String stuNum;	//
	
	private String profession;	//
	
	private Integer grade;	//
	
	private Integer stuClass;	//
	
	private Integer status;	//认证状态(0 = 认证中; 1 = 已认证; 2 = 不通过; -1 = 已删除)
	
	private static final long serialVersionUID = 1L;

}