package cn.licoy.wdog.core.entity.system;


import cn.licoy.wdog.core.entity.Schema;
import com.baomidou.mybatisplus.annotations.TableField;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SysDictionary extends Schema implements Serializable {

	private String parentId;	//
	
	private String dictCode;	//
	
	private String dictName;	//
	
	private String dictValue;	//
	
	private Integer sort;	//
	
	private String remark;	//
	
	private static final long serialVersionUID = 1L;

	@TableField(exist = false)
	private List<SysDictionary> children;

	@TableField(exist = false)
	private SysDictionary parent;

}