package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.GroupUser;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface GroupUserMapper extends BaseMapper<GroupUser>  {
	
}
