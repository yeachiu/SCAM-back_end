package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityForm;
import cn.licoy.wdog.core.mapper.app.ActivityFormMapper;
import cn.licoy.wdog.core.service.app.ActivityFormService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityFormServiceImpl extends ServiceImpl<ActivityFormMapper,ActivityForm> implements ActivityFormService{
	
}
