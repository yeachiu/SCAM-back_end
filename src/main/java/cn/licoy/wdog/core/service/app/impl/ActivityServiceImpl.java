package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.entity.app.*;
import cn.licoy.wdog.core.entity.system.*;
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import cn.licoy.wdog.core.mapper.app.ActivityMapper;
import cn.licoy.wdog.core.service.app.*;
import cn.licoy.wdog.core.service.system.SysUserAuthService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.dto.app.activity.StatusChangeDTO;
import cn.licoy.wdog.core.vo.app.SimpleGroupVO;
import cn.licoy.wdog.core.vo.system.SimpleUserAuthVO;
import cn.licoy.wdog.core.vo.system.SimpleUserVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.enums.IdType;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper,Activity> implements ActivityService{

    @Autowired
    private SysUserService userService;
    @Autowired
    private SysUserAuthService userAuthService;
    @Autowired
    private ActivityAdminsService adminsService;
    @Autowired
    private AGroupService groupService;
    @Autowired
    private ActivityLimitService limitService;
    @Autowired
    private ActivityFormService formService;
    @Autowired
    private ScoreSettingService scoreService;
    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private ActivityMapper mapper;

    /**
     * 某部门活动列表(分页)
     * @param findDTO 过滤条件
     * @return
     * #过滤取消状态#
     */
    @Override
    public Page<ActivityVO> getAllActivityByAparId(FindActivityDTO findDTO) {
        //校验
        Boolean exist = apartmentService.existApartment(findDTO.getId());
        if(!exist) throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门",findDTO.getId()));
        List<ActivityVO> activities = this.mapper.findActivitiesExCancelByAparId(findDTO.getId());
        for(ActivityVO acti : activities){
            List<SimpleGroupVO> limitList = limitService.findLimitByActiId(findDTO.getId());
            if (limitList != null && limitList.size()>0){
                acti.setGrouplimit(limitList);
            }
            List<SimpleUserVO> adminList = userService.findAllSimpleVOByActiId(findDTO.getId());
            if (adminList != null && adminList.size() > 0){
                acti.setOtherAdmin(adminList);
            }
        }
        Page<ActivityVO> activitiesPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        activitiesPage.setRecords(activities);
        return activitiesPage;
    }

    /**
     * 活动列表(分页)
     * @param findActivityDTO 过滤条件
     * @return
     * #过滤取消状态#
     */
    @Override
    public Page<ActivityVO> getAllActivityBySplitPage(FindActivityDTO findActivityDTO) {
        return null;
    }

    /**
     * 活动列表(回收站)
     * @param findActivityDTO
     * @return
     */
    @Override
    public Page<ActivityVO> getCancelActivityBySplitPage(FindActivityDTO findActivityDTO){
        return null;
    }

    /**
     * 添加活动
     * @param addDTO
     */
    @Override
    @Transactional
    public void add(ActivityAddDTO addDTO) {
        Activity findActivity = this.selectOne(new EntityWrapper<Activity>().eq("title",addDTO.getTitle()));
        if(findActivity != null){
            throw RequestException.fail(
                    String.format("已经存在名称为 %s 的活动",addDTO.getTitle()));
        }
        SysUserVO currentUser = userService.getCurrentUser();
        findActivity = new Activity();
        BeanUtils.copyProperties(addDTO,findActivity);
        findActivity.setCreateTime(new Date());
        findActivity.setCreateUser(currentUser.getId());
        System.out.println("======================= findActivity:" + findActivity.toString());
        boolean isSuccess = this.insert(findActivity);
        if (!isSuccess){
            throw RequestException.fail("活动创建失败");
        }
        String actiId = findActivity.getId();

        /** 活动管理员 **/
        //  1. 添加其他管理员
        List<ActivityAdmins> adminsList = new ArrayList<>();
        if (!addDTO.getOtherAdmin().equals("")){
            //字符串转数组
            String[] adminIds = addDTO.getOtherAdmin().split(",");
            SysUser user = null;
            for (String uid:adminIds) {
                user = userService.selectById(uid);
                if (user == null) {
                    throw RequestException.fail(String.format("操作异常：id为 %s 的认证用户不存在", uid));
                }
                ActivityAdmins admin = new ActivityAdmins();
                admin.setActivityId(actiId);
                admin.setUserId(uid);
                admin.setCreateTime(new Date());
                admin.setCreateUser(currentUser.getId());
                adminsList.add(admin);
            }
        }
        // 2. 添加系统管理员
        ActivityAdmins admin = new ActivityAdmins();
        admin.setActivityId(actiId);
        admin.setUserId(currentUser.getId());
        admin.setCreateTime(new Date());
        admin.setCreateUser(currentUser.getId());
        adminsList.add(admin);
        adminsService.insertBatch(adminsList);

        /** 分组限制 **/
        if (!addDTO.getGroupId().equals("")){
            String[] groups = addDTO.getGroupId().split(",");
            List<ActivityLimit> limitList = new ArrayList<>();

            AGroup group = new AGroup();
            for (String gid:groups) {
                group = groupService.selectById(gid);
                if (group == null){
                    throw RequestException.fail(
                            String.format("操作异常：id为 %s 的分组不存在", gid));
                }
                ActivityLimit limit = new ActivityLimit();
                limit.setAid(actiId);
                limit.setGid(gid);
                limit.setCreateTime(new Date());
                limit.setCreateUser(userService.getCurrentUser().getId());
                limitList.add(limit);
            }
            limitService.insertBatch(limitList);
        }
        /** 表单规则 **/
        if (!addDTO.getRules().equals("")){
            ActivityForm actiForm = new ActivityForm();
            actiForm.setActivityId(actiId);
            actiForm.setRules(addDTO.getRules());
            actiForm.setCreateTime(new Date());
            actiForm.setCreateUser(userService.getCurrentUser().getId());
//            actiForm.setStatus();
            formService.insert(actiForm);
        }

        /** 学分设置 **/

        //1.字符串数组转json对象数组
        if (!addDTO.getScoreData().equals("")){
            List<ScoreSetting> scoreList = JSONArray.parseArray(addDTO.getScoreData(),ScoreSetting.class);
            if (scoreList == null && scoreList.size()< 1){
                throw RequestException.fail("活动学分数据异常");
            }
            for (ScoreSetting score : scoreList) {
                score.setAid(actiId);
                score.setCreateTime(new Date());
                score.setCreateUser(userService.getCurrentUser().getId());
            }
            scoreService.insertBatch(scoreList);

        }

    }

    @Override
    public void update(String id,ActivityUpdateDTO updateDTO) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
    }

    @Override
    public void cancel(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
    }

    @Override
    public void publish(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
    }

    /**
     * 更改状态
     * @param statusChangeDTO
     *
     */
    @Override
    public void statusChange(StatusChangeDTO statusChangeDTO){
        Activity activity = this.selectById(statusChangeDTO.getAid());
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",statusChangeDTO.getAid()));
        }
    }

    @Override
    public ActivityAbstractVO getAbstractById(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
        ActivityAbstractVO abstractVO = new ActivityAbstractVO();
        BeanUtils.copyProperties(activity,abstractVO);
        return abstractVO;
    }
}
