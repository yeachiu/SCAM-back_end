package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.entity.app.*;
import cn.licoy.wdog.core.entity.system.SysUser;
import cn.licoy.wdog.core.mapper.app.ActivityMapper;
import cn.licoy.wdog.core.service.app.*;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.dto.app.activity.StatusChangeDTO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper,Activity> implements ActivityService{

    @Autowired
    private SysUserService userService;
    @Autowired
    private ActivityAdminsService adminsService;
    @Autowired
    private AGroupService groupService;
    @Autowired
    private ActivityLimitService limitService;
    @Autowired
    private ActivityFormService formService;

    /**
     * 活动列表
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
     * 更改状态
     * @param statusChangeDTO
     *
     */
    @Override
    public void statusChange(StatusChangeDTO statusChangeDTO){

    }
    /**============================================= >>>> addDTO:
     * ActivityAddDTO(
     *  title=信息, description=信息系, pictureUrl=/img_20190409010927.jpg,
     *  signUpTime=Tue Apr 09 00:00:00 CST 2019, deadlineTime=Wed Apr 10 00:00:00 CST 2019, startTime=Tue Apr 16 00:00:00 CST 2019, endTime=Wed Apr 17 00:00:00 CST 2019,
     *  limitQuota=100, isBlackList=null, isReview=null, status=0,
     *  groupId=parent 1-1,leaf 1-1-1,leaf 1-1-2,group01,
     *  rules=[
     *      {"type":"hidden","field":"activityId","value":"","validate":[],"event":{},"col":{"span":24},"emit":[],"props":{"hidden":false,"visibility":false,"elementId":"fc_12"},"on":{},"options":[],"title":"","className":"","emitEvent":{}},
     *      {"type":"input","title":"备注","field":"remarks","value":"","props":{"placeholder":"此处可输入备注","hidden":false,"visibility":false,"elementId":"fc_19"},"validate":[],"event":{},"col":{"span":24},"emit":[],"on":{},"options":[],"className":"","emitEvent":{}}
     *  ],
     *  scoreData=[{"awardName":"参与成功","awardNum":"","awardScore":2}])
     **/
    @Override
    public void add(ActivityAddDTO addDTO) {
        Activity findActivity = this.selectOne(new EntityWrapper<Activity>().eq("title",addDTO.getTitle()));
        if(findActivity != null){
            throw RequestException.fail(
                    String.format("已经存在用户名为 %s 的用户",addDTO.getTitle()));
        }
        findActivity = new Activity();
        BeanUtils.copyProperties(addDTO,findActivity);
        System.out.println("======================= findActivity:" + findActivity.toString());
        String actiId = UUID.randomUUID().toString();
        findActivity.setId(actiId);
        boolean isSuccess = this.insert(findActivity);
        if (!isSuccess){
            throw RequestException.fail("活动创建失败");
        }

        //  其他管理员   ==>     t_activityAdmins {id,activityId,userId}
        if (!addDTO.getOtherAdmins().equals("")){
            //字符串转数组
            String[] adminIds = addDTO.getOtherAdmins().split(",");
            List<ActivityAdmins> adminsList = new ArrayList<>();
            ActivityAdmins admin = new ActivityAdmins();
            SysUser user = null;
            for (String uid:adminIds) {
                user = userService.selectById(uid);
                if (user == null) {
                    throw RequestException.fail(
                            String.format("操作异常：id为 %s 的用户不存在", uid));
                }
                admin.setActivityId(actiId);
                admin.setUserId(uid);
                adminsList.add(admin);
            }
            adminsService.insertBatch(adminsList);

        }
        //  分组限制  ==>   t_groupLimit {id,actiId,groupId}
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
                limitList.add(limit);
            }
            limitService.insertBatch(limitList);
        }
        //  表单规则 ==>   t_activityForm {id,activityId,rules,status}
        if (!addDTO.getRules().equals("")){
            ActivityForm actiForm = new ActivityForm();
            actiForm.setActivityId(actiId);
            actiForm.setRules(addDTO.getRules());
//            actiForm.setStatus();
            formService.insert(actiForm);
        }
        //    ==>   t_scoreSetting {id,aid,awardName,awardNum,awardScore}
        //1.字符串数组转json对象数组
    }

    @Override
    public void update(String id,ActivityUpdateDTO updateDTO) {

    }

    @Override
    public void cancel(String id) {

    }

    @Override
    public void publish(String id) {

    }
}
