package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.entity.app.Student;
import lombok.Data;

@Data
public class ApartmentVO {

    private String id;

    private String name;	//

    private Student apartAdmin;	//SELECT FORM SysUserAuth BY userId

    private Object about;	//
}
