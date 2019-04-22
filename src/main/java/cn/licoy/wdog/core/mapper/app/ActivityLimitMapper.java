package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.vo.app.SimpleGroupVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ActivityLimitMapper extends BaseMapper<ActivityLimit>  {

    @Select("SELECT g.`name`, g.id FROM activity_limit al, a_group g WHERE al.gid = g.id AND al.aid =  #{actiId};")
    List<SimpleGroupVO> findLimitByActiId(String actiId);
	
}
