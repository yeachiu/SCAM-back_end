package cn.licoy.wdog.core.controller;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.service.app.ActivityService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;

@Slf4j
@Component //使spring管理
@EnableScheduling //定时任务注解
public class Timer {

    @Autowired
    private ActivityService activityService;

    @Scheduled(cron = "0/5 * * * * *")
    public void SignupTimer(){
        log.info("SignupTimer Scanning...");
        // 获取活动数据
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("status",2);
        List<Activity> list = activityService.selectList(wrapper);
        if (list != null && list.size()>0){
            for (Activity acti : list){
                boolean before = acti.getDeadlineTime().before(new Date());
                if (before){
                    acti.setStatus(ConstCode.ACT_STATUS_PROCESS);
                    acti.setModifyUser("System");
                    acti.setModifyTime(new Date());
                    activityService.updateById(acti);
                    log.info("活动" + acti.getTitle() + "更新状态: 进行中 [" + acti.getStatus() + "]");
                }
            }
        }


    }

    @Scheduled(cron = "0/5 * * * * *")
    public void ActivityTimer(){
        log.info("ActivityTimer Scanning...");
        // 获取活动数据
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("status",3);
        List<Activity> list = activityService.selectList(wrapper);
        if (list != null && list.size()>0) {
            for (Activity acti : list) {
                boolean before = acti.getEndTime().before(new Date());
                if (before) {
                    acti.setStatus(ConstCode.ACT_STATUS_COMPLETE);
                    acti.setModifyUser("System");
                    acti.setModifyTime(new Date());
                    activityService.updateById(acti);
                    log.info("活动 [ " + acti.getTitle() + " ] 更新状态: 已完成 [" + acti.getStatus() + "]");
                }
            }
        }

    }
}
