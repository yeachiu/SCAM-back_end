package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityFormEntry;
import cn.licoy.wdog.core.mapper.app.ActivityFormEntryMapper;
import cn.licoy.wdog.core.service.app.ActivityFormEntryService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityFormEntryServiceImpl extends ServiceImpl<ActivityFormEntryMapper,ActivityFormEntry> implements ActivityFormEntryService{
	
}
