package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.vo.system.UserAuthVO;
import lombok.Data;

@Data
public class ApartmentVO {

    private String id;

    private String name;	//

    private UserAuthVO apartAdmin;	//SELECT FORM SysUserAuth BY userId

    private String about;	//


}
