package cn.licoy.wdog.core.mapper.system;
//!
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SysUserAuthMapper extends BaseMapper<SysUserAuth> {

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className " +
            "FROM sys_user_auth a, a_group g, student s " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.`status` = 2")
    List<UserAuthVO> alreadyList();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className " +
            "FROM sys_user_auth a, a_group g, student s " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.`status` = 2 AND a.id NOT IN " +
            "(SELECT m.uid FROM apartment_member m WHERE m.isadmin = 0)")
    List<UserAuthVO> alreadyListExAdmin();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className " +
            "FROM sys_user_auth a, a_group g, student s " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.id = #{id}")
    UserAuthVO getById(String id);
}
