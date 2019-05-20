package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityMemberlist;
import cn.licoy.wdog.core.mapper.app.ActivityMemberlistMapper;
import cn.licoy.wdog.core.service.app.ActivityMemberlistService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityMemberlistServiceImpl extends ServiceImpl<ActivityMemberlistMapper,ActivityMemberlist> implements ActivityMemberlistService {
	
}
