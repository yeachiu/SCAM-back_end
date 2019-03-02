package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Group;
import cn.licoy.wdog.core.mapper.app.GroupMapper;
import cn.licoy.wdog.core.service.app.GroupService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GroupServiceImpl extends ServiceImpl<GroupMapper,Group> implements GroupService{
	
}
