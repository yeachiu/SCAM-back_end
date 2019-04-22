package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.mapper.app.ActivityLimitMapper;
import cn.licoy.wdog.core.service.app.ActivityLimitService;
import cn.licoy.wdog.core.vo.app.SimpleAGroupVO;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ActivityLimitServiceImpl extends ServiceImpl<ActivityLimitMapper,ActivityLimit> implements ActivityLimitService{

    @Autowired
    private ActivityLimitMapper mapper;
    @Override
    public List<SimpleAGroupVO> findLimitByActiId(String actiId) {
        return this.mapper.findLimitByActiId(actiId);
    }
}
