package cn.licoy.wdog.core.mapper.app;
//!
import cn.licoy.wdog.core.entity.app.UserAuth;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserAuthMapper extends BaseMapper<UserAuth> {

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.dict_id = d.id")
    List<UserAuthVO> list();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.dict_id = d.id AND a.`status` = 1")
    List<UserAuthVO> inauthList();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.`status` = 2 AND a.dict_id = d.id")
    List<UserAuthVO> alreadyList();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.`status` = 2  AND a.dict_id = d.id AND a.uid NOT IN " +
            "(SELECT m.uid FROM apartment_member m WHERE m.isadmin = 0)")
    List<UserAuthVO> alreadyListExAdmin();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.`status` = 2 AND a.dict_id = d.id AND a.uid NOT IN " +
            "(SELECT uid FROM apartment_member)")
    List<UserAuthVO> alreadyListExMember();

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.dict_id = d.id AND a.id = #{id}")
    UserAuthVO getById(String id);

    @Select("SELECT s.group_id FROM user_auth a, student s WHERE a.stu_id = s.id AND a.uid = #{userId}")
    String getGroupIdByUserId(String userId);

    @Select("SELECT a.id, a.uid, a.stu_id, a.real_name, a.stu_num, a.dict_id, a.period, a.what_class, a.`status`, g.`name` AS className, d.dict_name AS profession " +
            "FROM user_auth a, a_group g, student s, sys_dictionary d " +
            "WHERE a.stu_id = s.id AND s.group_id = g.id AND a.dict_id = d.id AND a.uid = #{uid}")
    UserAuthVO getByUserId(String uid);
}
