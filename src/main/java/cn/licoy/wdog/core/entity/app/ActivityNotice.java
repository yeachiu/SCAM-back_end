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
public class ActivityNotice extends Schema implements Serializable {
	
	private String aid;	//
	
	private String message;	//
	
	private String sendType;	//发送方式：短信、邮箱等
	
	private Integer operateType;	//0:手动; 1:自动
	
	private Date noticeTime;	//
	
	private static final long serialVersionUID = 1L;

}