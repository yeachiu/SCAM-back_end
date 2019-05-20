package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ScoreAllocation extends Schema implements Serializable {
	
	private String sid;	//
	
	private String aid;	//
	
	private String uid;	//
	
	private static final long serialVersionUID = 1L;

}