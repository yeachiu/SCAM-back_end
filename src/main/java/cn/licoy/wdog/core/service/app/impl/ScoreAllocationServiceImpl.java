package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ScoreAllocation;
import cn.licoy.wdog.core.mapper.app.ScoreAllocationMapper;
import cn.licoy.wdog.core.service.app.ScoreAllocationService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ScoreAllocationServiceImpl extends ServiceImpl<ScoreAllocationMapper,ScoreAllocation> implements ScoreAllocationService{
	
}
