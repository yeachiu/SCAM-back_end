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
public class ScoreSetting extends Schema implements Serializable {
	
	private String aid;	//
	
	private String awardName;	//
	
	private Integer awardNum;	//
	
	private Integer awardScore;	//
	
	private Date notifyTime;	//
	
	private String notifyUser;	//
	
	private static final long serialVersionUID = 1L;

}