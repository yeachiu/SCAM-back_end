package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Blacklist;
import cn.licoy.wdog.core.mapper.app.BlacklistMapper;
import cn.licoy.wdog.core.service.app.BlacklistService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class BlacklistServiceImpl extends ServiceImpl<BlacklistMapper,Blacklist> implements BlacklistService {
	
}
