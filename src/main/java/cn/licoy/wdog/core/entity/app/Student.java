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
public class Student extends Schema implements Serializable {
	
	private String realName;	//
	
	private String stuNum;	//
	
	private String profession;	//
	
	private Integer grade;	//
	
	private Integer stuClass;	//
	
	private static final long serialVersionUID = 1L;

}