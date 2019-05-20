package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student extends Schema implements Serializable {
	

	private String realName;	//
	
	private String stuNum;	//
	
	private String groupId;	//具体到班级的分组

	@TableField(exist = false)
	private String userId;

	private static final long serialVersionUID = 1L;

}