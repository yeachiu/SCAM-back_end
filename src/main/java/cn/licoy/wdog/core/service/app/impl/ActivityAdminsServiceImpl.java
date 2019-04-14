package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityAdmins;
import cn.licoy.wdog.core.mapper.app.ActivityAdminsMapper;
import cn.licoy.wdog.core.service.app.ActivityAdminsService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityAdminsServiceImpl extends ServiceImpl<ActivityAdminsMapper,ActivityAdmins> implements ActivityAdminsService{
	
}
