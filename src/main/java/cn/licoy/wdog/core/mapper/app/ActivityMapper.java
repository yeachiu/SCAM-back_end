package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.Activity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ActivityMapper extends BaseMapper<Activity>  {
	
	@Select("SELECT a.id, a.title, a.description, a.picture_url AS pictureUrl, a.signup_time AS signupTime, a.deadline_time AS deadlineTime, a.start_time AS startTime, a.end_time AS endTime, a.`status`, " +
	    "a.create_time AS createTime, a.create_user AS createUser, a.limit_quota, a.isreview " +
	    "FROM activity a WHERE a.`status` != 0 AND a.organizer_id = #{aparId}")
    List<ActivityVO> findActivitiesExCancelByAparId(String aparId);
	
}
