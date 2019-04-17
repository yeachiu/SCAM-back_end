package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityAdmins;
import cn.licoy.wdog.core.mapper.app.ActivityAdminsMapper;
import cn.licoy.wdog.core.service.app.ActivityAdminsService;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ActivityAdminsServiceImpl extends ServiceImpl<ActivityAdminsMapper,ActivityAdmins> implements ActivityAdminsService{

    @Autowired
    private ActivityService activityService;

    @Override
    public List<ActivityAbstractVO> findActiAbstractByAdminId(String uid) {
        List<ActivityAbstractVO> activityAbstractVOList = new ArrayList<>();
        List<ActivityAdmins> activityAdminses = this.selectList(new EntityWrapper<ActivityAdmins>()
                .eq("user_id",uid));
        if (activityAdminses != null && activityAdminses.size()>0){
            for (ActivityAdmins actiAdmin: activityAdminses) {
                ActivityAbstractVO abstractVO = activityService.getAbstractById(actiAdmin.getActivityId());
                if (abstractVO != null){
                    activityAbstractVOList.add(abstractVO);
                }
            }
        }
        return activityAbstractVOList;
    }
}

