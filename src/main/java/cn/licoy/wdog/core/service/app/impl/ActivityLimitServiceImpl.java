package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.entity.system.SysUser;
import cn.licoy.wdog.core.mapper.app.ActivityLimitMapper;
import cn.licoy.wdog.core.service.app.ActivityLimitService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.SimpleGroupVO;
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
public class ActivityLimitServiceImpl extends ServiceImpl<ActivityLimitMapper,ActivityLimit> implements ActivityLimitService{

    @Autowired
    private ActivityLimitMapper mapper;
    @Autowired
    private SysUserService userService;

    /**
     * 活动分组列表
     * @param actiId
     * @return
     */
    @Override
    public List<SimpleGroupVO> findLimitByActiId(String actiId) {
        return this.mapper.findLimitByActiId(actiId);
    }

    /**
     * 某分组权限下的活动ID
     *
     * @param groupId
     */
    @Override
    public List<String> findActiIdsByGroupId(String groupId) {
        return this.mapper.findActiIdsByGroupId(groupId);
    }

    /**
     * 更新活动分组信息
     *
     * @param actiId
     * @param groupId
     */
    @Override
    public void updateByActiId(String actiId, String groupId) {
        // 获取原有信息
        List<ActivityLimit> unchangelist = new ArrayList<>();
        List<ActivityLimit> newlist = new ArrayList<>();
        // 根据活动ID获取原有数据
        List<ActivityLimit> oldlist = this.selectList(new EntityWrapper<ActivityLimit>().eq("aid",actiId));
        // 读取数据并转换
        if (!groupId.equals("")){
            //字符串转数组
            String[] adminIds = groupId.split(",");
            SysUser user = null;
            for (String gid:adminIds) {
                // 未改变的管理员
                ActivityLimit group = this.selectOne(new EntityWrapper<ActivityLimit>()
                        .eq("aid",actiId).and()
                        .eq("gid",gid));
                if (group != null){
                    unchangelist.add(group);
                }else{  //新增的管理员
                    group = new ActivityLimit();
                    group.setGid(gid);
                    group.setAid(actiId);
                    group.setCreateTime(new Date());
                    group.setCreateUser(userService.getCurrentUser().getId());
                    newlist.add(group);
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
