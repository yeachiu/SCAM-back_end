package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.Group;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface GroupMapper extends BaseMapper<Group>  {
	
}
