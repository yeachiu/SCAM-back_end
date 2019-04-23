package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.ActivityMember;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ActivityMemberMapper extends BaseMapper<ActivityMember>  {

    @Select("SELECT COUNT(uid) FROM activity_member WHERE acti_id = #{actiId}")
    Integer getSignupNumByActiId (String actiId);
	
}
