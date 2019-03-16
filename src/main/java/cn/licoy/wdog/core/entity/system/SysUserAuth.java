package cn.licoy.wdog.core.entity.system;


import cn.licoy.wdog.core.entity.Schema;
import com.baomidou.mybatisplus.annotations.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SysUserAuth implements Serializable {

	@TableId
	private String id;

	private String uid;	//用户表外键
	
	private String realName;	//姓名
	
	private Integer stuClass;	//班级
	
	private Integer grade;	//年级
	
	private String profession;	//专业
	
	private Integer stuNum;	//学号

	private Integer status;	//认证状态
	
	private static final long serialVersionUID = 1L;

}