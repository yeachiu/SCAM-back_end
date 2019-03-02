package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.GroupUser;
import cn.licoy.wdog.core.mapper.app.GroupUserMapper;
import cn.licoy.wdog.core.service.app.GroupUserService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class GroupUserServiceImpl extends ServiceImpl<GroupUserMapper,GroupUser> implements GroupUserService{
	
}
