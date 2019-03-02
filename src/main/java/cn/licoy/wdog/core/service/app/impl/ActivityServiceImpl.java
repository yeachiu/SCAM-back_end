package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdate;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.mapper.app.ActivityMapper;
import cn.licoy.wdog.core.service.app.ActivityService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper,Activity> implements ActivityService{
    @Override
    public void add(ActivityAddDTO addDTO) {

    }

    @Override
    public void update(ActivityUpdate updateDTO) {

    }
}
