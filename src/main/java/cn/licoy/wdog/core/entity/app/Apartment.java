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
public class Apartment extends Schema implements Serializable {
	
	private String name;	//
	
	private String apartAdmin;	//
	
	private String about;	//
	
	private static final long serialVersionUID = 1L;

}
