package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityNotice;
import cn.licoy.wdog.core.mapper.app.ActivityNoticeMapper;
import cn.licoy.wdog.core.service.app.ActivityNoticeService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityNoticeServiceImpl extends ServiceImpl<ActivityNoticeMapper,ActivityNotice> implements ActivityNoticeService {
	
}
