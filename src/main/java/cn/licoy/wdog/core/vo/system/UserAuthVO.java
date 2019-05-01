package cn.licoy.wdog.core.vo.system;

import cn.licoy.wdog.core.vo.app.GroupVO;
import lombok.Data;

@Data
public class UserAuthVO {

    private String id;  //

    private String uid;	//

    private String stuId;	//

    private String realName;	//

    private String stuNum;	//

    private String dictId;	//

    private Integer period;	//

    private Integer whatClass;	//

    private Integer status;	//认证状态(0 = 认证中; 1 = 已认证; 2 = 不通过; -1 = 已删除)

    /***************************************************/

    private String className;

    private String profession;
}
