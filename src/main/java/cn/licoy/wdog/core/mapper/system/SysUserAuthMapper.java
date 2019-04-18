package cn.licoy.wdog.core.mapper.system;

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

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.whatClass, a.`status` " +
            "g.name AS className FROM sys_user_auth a, a_group g, student stu " +
            "WHERE a.stu_id = stu.id AND stu.group_id=g.id;")
    List<UserAuthVO> alreadyList();
}