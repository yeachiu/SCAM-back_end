package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityMember;
import cn.licoy.wdog.core.mapper.app.ActivityMemberMapper;
import cn.licoy.wdog.core.service.app.ActivityMemberService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityMemberServiceImpl extends ServiceImpl<ActivityMemberMapper,ActivityMember> implements ActivityMemberService{
	
}
