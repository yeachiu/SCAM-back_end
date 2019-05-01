package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.entity.app.ActivityAdmins;
import cn.licoy.wdog.core.entity.system.SysUser;
import cn.licoy.wdog.core.mapper.app.ActivityAdminsMapper;
import cn.licoy.wdog.core.service.app.ActivityAdminsService;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ActivityAdminsServiceImpl extends ServiceImpl<ActivityAdminsMapper,ActivityAdmins> implements ActivityAdminsService{

    @Autowired
    private ActivityService activityService;
    @Autowired
    private SysUserService userService;

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

    /**
     * 更新活动管理员信息
     *
     * @param actiId
     * @param otherAdmin
     */
    @Override
    public void updateByActiId(String actiId, String otherAdmin) {
        List<ActivityAdmins> unchangelist = new ArrayList<>();
        List<ActivityAdmins> newlist = new ArrayList<>();
        // 根据活动ID获取原有数据
        List<ActivityAdmins> oldlist = this.selectList(new EntityWrapper<ActivityAdmins>().eq("activity_id",actiId));
        // 读取数据并转换
        if (!otherAdmin.equals("")){
            //字符串转数组
            String[] adminIds = otherAdmin.split(",");
            SysUser user = null;
            for (String uid:adminIds) {
                // 未改变的管理员
                ActivityAdmins admin = this.selectOne(new EntityWrapper<ActivityAdmins>()
                        .eq("activity_id",actiId).and()
                        .eq("user_id",uid));
                if (admin != null){
                    unchangelist.add(admin);
                }else{  //新增的管理员
                    admin = new ActivityAdmins();
                    admin.setUserId(uid);
                    admin.setActivityId(actiId);
                    admin.setCreateTime(new Date());
                    admin.setCreateUser(userService.getCurrentUser().getId());
                    newlist.add(admin);
                }
            }
            // 删除的管理员
            oldlist.removeAll(unchangelist);

            // 执行更新操作
            if (newlist != null && newlist.size()>0){
                this.insertBatch(newlist);
            }
            if (oldlist != null && oldlist.size()>0){
                this.deleteBatchIds(oldlist);
            }
        }
    }
}

