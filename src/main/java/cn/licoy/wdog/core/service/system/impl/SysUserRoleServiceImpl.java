package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.core.entity.system.SysRole;
import cn.licoy.wdog.core.entity.system.SysUserRole;
import cn.licoy.wdog.core.mapper.system.SysUserRoleMapper;
import cn.licoy.wdog.core.service.system.SysRoleService;
import cn.licoy.wdog.core.service.system.SysUserRoleService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Licoy
 * @version 2018/4/16/11:32
 */
@Service
@Transactional
public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper,SysUserRole> implements SysUserRoleService {

    @Autowired
    private SysRoleService roleService;

    @Override
    public void add(SysUserRole userRole) {
        this.insert(userRole);
        this.updateAuthCache(userRole.getRid());
    }

    @Override
    public void remove(String uid, String rid) {
        this.delete(new EntityWrapper<SysUserRole>()
                .eq("uid",uid)
                .and()
                .eq("rid",rid));
        this.updateAuthCache(rid);
    }

    @Override
    public void removeByUid(String uid) {
        List<SysUserRole> list = this.selectList(new EntityWrapper<SysUserRole>().eq("uid",uid));
        if (list != null && list.size()>0){
            for(SysUserRole ur : list){
                this.deleteById(ur.getId());
                this.updateAuthCache(ur.getRid());
            }
        }


    }

    @Override
    public void update(SysUserRole userRole) {
        this.updateById(userRole);
        this.updateAuthCache(userRole.getRid());
    }

    @Override
    public void updateAuthCache(String rid) {
        SysRole role = roleService.selectById(rid);
        roleService.updateCache(role,true,false);
    }
}
