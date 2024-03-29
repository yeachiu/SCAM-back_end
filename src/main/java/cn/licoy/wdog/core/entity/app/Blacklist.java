package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Blacklist extends Schema implements Serializable {
	
	private String aid;	//apartmentId
	
	private String uid;	//userId
	
	private String sid;	//studentId
	
	private static final long serialVersionUID = 1L;

}