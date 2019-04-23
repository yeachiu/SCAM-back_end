package cn.licoy.wdog.core.vo.system;

import cn.licoy.wdog.core.entity.system.SysResource;
import cn.licoy.wdog.core.entity.system.SysRole;
import lombok.Data;

import java.util.Date;
import java.util.List;


@Data
public class SysUserVO {

    private String id;
    private String username;
    private Integer age;
    private Integer status;
    private List<SysRole> roles;
    private Date createDate;
    private List<SysResource> resources;

    private String aparId;
    private String stuId;
    
    private String avatar;

}
