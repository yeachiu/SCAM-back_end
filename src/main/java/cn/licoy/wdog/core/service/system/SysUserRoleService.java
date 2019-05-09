package cn.licoy.wdog.core.service.system;

import cn.licoy.wdog.core.entity.system.SysUserRole;
import com.baomidou.mybatisplus.service.IService;


public interface SysUserRoleService extends IService<SysUserRole> {

    void add(SysUserRole userRole);

    void remove(String uid, String rid);

    void removeByUid(String uid);

    void update(SysUserRole userRole);

    void updateAuthCache(String rid);


}
