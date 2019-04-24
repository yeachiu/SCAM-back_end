package cn.licoy.wdog.core.mapper.system;

import cn.licoy.wdog.core.entity.system.SysUser;
import cn.licoy.wdog.core.vo.system.NameAndIdVO;
import cn.licoy.wdog.core.vo.system.SimpleUserVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SysUserMapper extends BaseMapper<SysUser> {

    @Select("SELECT m.apar_id FROM sys_user u, sys_user_auth a, apartment_member m " +
            "WHERE u.id = a.uid AND a.id = m.uid AND u.id = #{id}")
    String getAparIdById(String id);

    @Select("SELECT a.stu_id FROM sys_user u, sys_user_auth a " +
            "WHERE u.id = a.uid AND a.uid = #{id}")
    String getStuIdById(String id);

    @Select("SELECT u.id, u.username FROM sys_user u WHERE u.id NOT IN "+
            "(SELECT uid FROM sys_user_auth)")
    List<SimpleUserVO> unauthList();

    @Select("SELECT u.id, u.username, auth.real_name AS realName, u.avatar FROM sys_user u, sys_user_auth auth WHERE u.id = auth.uid AND u.id = #{id}")
    SimpleUserVO findSimpleVOById(String id);

    @Select("SELECT u.id, u.username, auth.real_name AS realName, u.avatar FROM sys_user u, sys_user_auth auth WHERE u.id = auth.uid AND u.id IN (SELECT user_id FROM activity_admins WHERE activity_id = #{actiId})")
    List<SimpleUserVO> findAllSimpleVOByActiId(String actiId);

}
