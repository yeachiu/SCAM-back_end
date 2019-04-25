package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ActivityMapper extends BaseMapper<Activity>  {

    @Select("SELECT a.id, a.title, a.description, a.address, a.picture_url AS pictureUrl, a.signup_time AS signupTime, a.deadline_time AS deadlineTime, a.start_time AS startTime, a.end_time AS endTime, a.`status`, " +
            "a.create_time AS createTime, a.create_user AS createUser, a.limit_quota, a.isreview, a.organizer_id AS organizerId " +
            "FROM activity a WHERE a.`status` != 0 AND a.organizer_id = #{aparId}")
    List<ActivityVO> findActivitiesExCancelByAparId(String aparId);

    @Select("SELECT a.id, a.title, a.description, a.address, a.picture_url AS pictureUrl, a.signup_time AS signupTime, a.deadline_time AS deadlineTime, a.start_time AS startTime, a.end_time AS endTime, a.`status`, " +
            "a.create_time AS createTime, a.create_user AS createUser, a.limit_quota, a.isreview, a.organizer_id AS organizerId " +
            "FROM activity a WHERE a.`status` = 0 AND a.organizer_id = #{aparId}")
    List<ActivityVO> findCancelActivitiesByAparId(String aparId);
	
}
