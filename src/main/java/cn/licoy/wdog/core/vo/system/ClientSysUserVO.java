package cn.licoy.wdog.core.vo.system;

import cn.licoy.wdog.core.entity.system.SysResource;
import cn.licoy.wdog.core.entity.system.SysRole;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ClientSysUserVO {

    private String id;
    private String username;
    private Integer age;
    private String avatar;
    private Date createDate;

    private UserAuthVO userAuth;
}