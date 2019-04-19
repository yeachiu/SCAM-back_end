package cn.licoy.wdog.core.mapper.system;

import cn.licoy.wdog.core.entity.system.SysUser;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SysUserMapper extends BaseMapper<SysUser> {

    @Select("SELECT m.apar_id FROM sys_user u, sys_user_auth a, apartment_member m " +
            "WHERE u.id = a.uid AND a.stu_id = m.uid AND u.id = #{id}")
    String getAparIdById(String id);

    @Select("SELECT a.stu_id FROM sys_user u, sys_user_auth a " +
            "WHERE u.id = a.uid AND a.uid = #{id}")
    String getStuIdById(String id);

}
