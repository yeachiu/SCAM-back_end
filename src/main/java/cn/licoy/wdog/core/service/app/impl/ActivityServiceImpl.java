package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.common.util.StringUtils;
import cn.licoy.wdog.common.util.Tools;
import cn.licoy.wdog.core.dto.app.activity.*;
import cn.licoy.wdog.core.entity.app.*;
import cn.licoy.wdog.core.entity.system.*;
import cn.licoy.wdog.core.mapper.app.ActivityMapper;
import cn.licoy.wdog.core.service.app.*;
import cn.licoy.wdog.core.service.app.UserAuthService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.*;
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

import static com.sun.org.apache.xalan.internal.xsltc.compiler.util.Type.Int;

@Service
@Transactional
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper,Activity> implements ActivityService{

    @Autowired
    private SysUserService userService;
    @Autowired
    private UserAuthService userAuthService;
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
    private ActivityMemberService activityMemberService;

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
            this.changeToVO(acti);
        }
        Page<ActivityVO> activitiesPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        activitiesPage.setRecords(activities);
        return activitiesPage;
    }

    /**
     * 活动列表(回收站)
     * @param findDTO
     * @return
     */
    @Override
    public Page<ActivityVO> getCancelActivityBySplitPage(FindActivityDTO findDTO){
        //校验
        Boolean exist = apartmentService.existApartment(findDTO.getId());
        if(!exist) throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门",findDTO.getId()));

        List<ActivityVO> activities = this.mapper.findCancelActivitiesByAparId(findDTO.getId());
        for(ActivityVO acti : activities){
            this.changeToVO(acti);
        }
        Page<ActivityVO> activitiesPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        activitiesPage.setRecords(activities);
        return activitiesPage;
    }

    /**
     * 根据活动状态获取数据
     */
    @Override
    public List<SimpleActivityVO> getSimpleListByStatus(SimpleActivityDTO dto) {
        //校验
        Boolean exist = apartmentService.existApartment(dto.getAparId());
        if(!exist) throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门",dto.getAparId()));
        List<SimpleActivityVO> list = new ArrayList<>();
        List<Activity> activities = this.selectList(new EntityWrapper<Activity>().eq("organizer_id",dto.getAparId()).and().eq("status",dto.getStatus()));
        for(Activity acti : activities){
            SimpleActivityVO vo = new SimpleActivityVO();
            vo.setId(acti.getId());
            vo.setTitle(acti.getTitle());
            list.add(vo);
        }

        return list;

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
        if (!addDTO.getRules().equals(""))
            formService.add(actiId,addDTO.getRules());

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
        SysUserVO currentUser = userService.getCurrentUser();
        BeanUtils.copyProperties(updateDTO,activity);
        activity.setPictureUrl(activity.getPictureUrl().replace(ConstCode.staticResourcePath,""));
        activity.setModifyTime(new Date());
        activity.setModifyUser(currentUser.getId());
        this.updateById(activity);

        /** 活动管理员 **/
        adminsService.updateByActiId(activity.getId(),updateDTO.getOtherAdmin());
        /** 分组限制 **/
        limitService.updateByActiId(activity.getId(),updateDTO.getGroupId());
    }

    @Override
    public void remove(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
        adminsService.removeAllByActiId(id);
        this.deleteById(id);
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
        activity.setStatus(statusChangeDTO.getStatus());
        activity.setModifyUser(userService.getCurrentUser().getId());
        activity.setModifyTime(new Date());
        this.updateById(activity);
    }

    /**
     * 获取单个活动信息(详细)
     *
     * @param id
     */
    @Override
    public ActivityVO getById(String id) {
        Activity activity = this.selectById(id);
        if (activity == null)
            throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门",id));
        ActivityVO activityVO = new ActivityVO();
        BeanUtils.copyProperties(activity,activityVO);
        return this.changeToVO(activityVO);
    }

    /**
     * 活动是否存在
     *
     * @param id
     */
    @Override
    public Boolean isExistActivity(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            return false;
        }
        return true;
    }

    /**
     * 活动是否有效(结束或删除)
     *
     * @param id
     */
    @Override
    public Boolean isEffective(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            return false;
        }
        int status = activity.getStatus();
        if(status == ConstCode.ACT_STATUS_DONE || status == ConstCode.ACT_STATUS_CANCEL ){
            return false;
        }
        return true;
    }

    private ActivityVO changeToVO(ActivityVO acti){

        acti.setPictureUrl(ConstCode.staticResourcePath + acti.getPictureUrl());
        //获取分组限制
        List<SimpleGroupVO> limitList = limitService.findLimitByActiId(acti.getId());
        if (limitList != null && limitList.size()>0){
            acti.setGrouplimit(limitList);
        }
        //获取管理员
        List<SimpleUserVO> adminList = userService.findAllSimpleVOByActiId(acti.getId());
        if (adminList != null && adminList.size() > 0){
            acti.setOtherAdmin(adminList);
        }
        //获取主办部门信息
        ApartmentVO apartmentVO = apartmentService.getById(acti.getOrganizerId());
        SimpleApartmentVO simpleApartmentVO = new SimpleApartmentVO();
        BeanUtils.copyProperties(apartmentVO,simpleApartmentVO);
        acti.setOrganizer(simpleApartmentVO);
        //获取当前报名人数
        acti.setMemberNow(activityMemberService.getSignupNumByActiId(acti.getId()));
        //获取表单规则
        ActivityForm activityForm = formService.getByActiId(acti.getId());
        if (activityForm != null){
            acti.setRules(activityForm.getRules());
        }
        return acti;
    }

    /******************************************************************************************************
     *
     *   ***  客户端请求 ***
     *
     ******************************************************************************************************/

    /**
     * 根据活动ID获取该活动简要信息
     * @param id
     * @return
     */
    @Override
    public ActivityAbstractVO getAbstractById(String id) {
        Activity activity = this.selectById(id);
        if (activity == null){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的活动数据",id));
        }
        if (activity.getStatus().equals(ConstCode.ACT_STATUS_CANCEL)
                || activity.getStatus().equals(ConstCode.ACT_STATUS_DRAFT) ){
            return null;
        }
        ActivityAbstractVO abstractVO = new ActivityAbstractVO();
        BeanUtils.copyProperties(activity,abstractVO);
        abstractVO.setDescription(StringUtils.subTextString(abstractVO.getDescription(),100));
        ApartmentVO apartmentVO = apartmentService.getById(abstractVO.getOrganizerId());
        if(apartmentVO != null)
            abstractVO.setOrganizerName(apartmentVO.getName());
        abstractVO.setPictureUrl(ConstCode.staticResourcePath + abstractVO.getPictureUrl());
        return abstractVO;
    }

    /**
     * 获取所有有效活动数据
     * @return
     */
    @Override
    public List<ActivityAbstractVO> getAllEffectiveActivity() {
        List<ActivityAbstractVO> activities = mapper.getAllEffectiveActivity();
        for(ActivityAbstractVO abstractVO : activities){
            abstractVO.setDescription(StringUtils.subTextString(abstractVO.getDescription(),200));
            ApartmentVO apartmentVO = apartmentService.getById(abstractVO.getOrganizerId());
            if(apartmentVO != null)
                abstractVO.setOrganizerName(apartmentVO.getName());
            abstractVO.setPictureUrl(ConstCode.staticResourcePath + abstractVO.getPictureUrl());
        }
        return activities;
    }

    /**
     * 获取用户权限下所有活动信息
     *
     * @param userId
     * @return
     */
    @Override
    public List<ActivityAbstractVO> getByUserId(String userId) {
        /** 1.获取用户分组ID
         *  2.根据groupId获取该分组具有权限的活动IDS
         *  3.获取相应的活动信息列表
         */
        Boolean exist = userService.isExist(userId);
        if (!exist){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的用户数据，请联系管理员",userId));
        }
        String groupId = userAuthService.getGroupIdByUserId(userId);
        //获取所属的分组
        List<String> groupIds = groupService.findAllBelongGroupIds(groupId);
        //获取所有分组关联的活动数据
        List<String> actiIds = new ArrayList<>();
        for(String id : groupIds){
            actiIds.addAll(limitService.findActiIdsByGroupId(id));
        }
        //去重
        actiIds = Tools.removeDuplicate(actiIds);
        List<ActivityAbstractVO> list = new ArrayList<>();
        for (String actiId:actiIds ) {
            ActivityAbstractVO abstractVO = this.getAbstractById(actiId);
            if (abstractVO != null
                    && !abstractVO.getStatus().equals(ConstCode.ACT_STATUS_CANCEL)
                    && !abstractVO.getStatus().equals(ConstCode.ACT_STATUS_DRAFT) ){
                list.add(abstractVO);
            }
        }
        return list;
    }

    /**
     * 获取用户参与的所有活动数据
     *
     * @param userId
     * @return
     */
    @Override
    public List<ActivityAbstractVO> getJoinInByUserId(String userId) {
        /**
         * 用户参与活动的记录在activity_member数据表中
         */
        //参数校验
        Boolean exist = userService.isExist(userId);
        if (!exist){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的用户数据，请联系管理员",userId));
        }

        //获取活动IDS
        List<String> actiIds = activityMemberService.getActiIdsByUid(userId);

        //获取活动信息
        List<ActivityAbstractVO> list = new ArrayList<>();
        for (String actiId:actiIds ) {
            ActivityAbstractVO abstractVO = this.getAbstractById(actiId);
            if (abstractVO != null
                    && !abstractVO.getStatus().equals(ConstCode.ACT_STATUS_CANCEL)
                    && !abstractVO.getStatus().equals(ConstCode.ACT_STATUS_DRAFT) ){
                list.add(abstractVO);
            }
        }
        return list;
    }

    /**
     * 获取用户关注的所有活动数据
     * @param userId
     * @return
     */
    @Override
    public List<ActivityAbstractVO> getFocusByUserId(String userId) {
        return null;
    }
}
