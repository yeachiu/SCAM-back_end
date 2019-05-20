package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.entity.app.ActivityForm;
import cn.licoy.wdog.core.mapper.app.ActivityFormMapper;
import cn.licoy.wdog.core.service.app.ActivityFormService;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.service.system.SysUserService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
@Transactional
public class ActivityFormServiceImpl extends ServiceImpl<ActivityFormMapper,ActivityForm> implements ActivityFormService {

    @Autowired
    private SysUserService userService;
    @Autowired
    private ActivityService activityService;
    /**
     * 获取活动报名表规则
     *
     * @param actiId
     * @return
     */
    @Override
    public ActivityForm getByActiId(String actiId) {
        ActivityForm rule = this.selectOne(new EntityWrapper<ActivityForm>().eq("activity_id",actiId));
        if (rule == null)
            throw RequestException.fail("获取失败，活动ID失效，请联系管理员");
        return rule;
    }

    /**
     * 添加表单规则
     *
     * @param actiId
     * @param rules
     */
    @Override
    public void add(String actiId, String rules) {
        ActivityForm actiForm = new ActivityForm();
        actiForm.setActivityId(actiId);
        actiForm.setRules(rules);
        actiForm.setCreateTime(new Date());
        actiForm.setCreateUser(userService.getCurrentUser().getId());
//            actiForm.setStatus();
        this.insert(actiForm);
    }

    /**
     * 更新某个活动的学分设置数据
     *
     * @param actiId
     * @param rules
     */
    @Override
    public void updateByActiId(String actiId, String rules) {
        boolean exist = activityService.isExistActivity(actiId);
        if (!exist){
            throw RequestException.fail("更新失败，活动ID失效，请联系管理员");
        }
        ActivityForm activityForm = this.selectOne(new EntityWrapper<ActivityForm>().eq("activity_id",actiId));
        if (activityForm == null){
            throw RequestException.fail("更新失败，数据获取失败，请刷新重试");
        }
        activityForm.setRules(rules);
        activityForm.setModifyUser(userService.getCurrentUser().getId());
        activityForm.setModifyTime(new Date());
        this.updateById(activityForm);
    }
}
