package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.mapper.app.ActivityLimitMapper;
import cn.licoy.wdog.core.service.app.ActivityLimitService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityLimitServiceImpl extends ServiceImpl<ActivityLimitMapper,ActivityLimit> implements ActivityLimitService{
	
}
