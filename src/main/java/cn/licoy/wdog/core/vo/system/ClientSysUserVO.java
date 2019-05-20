package cn.licoy.wdog.core.vo.system;

import lombok.Data;

import java.util.Date;

@Data
public class ClientSysUserVO {

    private String id;
    private String username;
    private Integer age;
    private String avatar;
    private Date createDate;

    private UserAuthVO userAuth;
}