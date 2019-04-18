package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.vo.StudentVO;
import lombok.Data;

@Data
public class ApartmentVO {

    private String id;

    private String name;	//

    private StudentVO apartAdmin;	//SELECT FORM SysUserAuth BY userId

    private String about;	//


}
