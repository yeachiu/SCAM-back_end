package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ScoreSetting;
import cn.licoy.wdog.core.mapper.app.ScoreSettingMapper;
import cn.licoy.wdog.core.service.app.ScoreSettingService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ScoreSettingServiceImpl extends ServiceImpl<ScoreSettingMapper,ScoreSetting> implements ScoreSettingService{
	
}
