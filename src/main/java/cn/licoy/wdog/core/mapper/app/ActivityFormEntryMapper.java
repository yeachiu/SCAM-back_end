package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.ActivityFormEntry;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ActivityFormEntryMapper extends BaseMapper<ActivityFormEntry>  {
	
}
