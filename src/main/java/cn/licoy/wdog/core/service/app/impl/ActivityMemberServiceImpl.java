package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.activity.ActivityMemberDTO;
import cn.licoy.wdog.core.entity.app.ActivityMember;
import cn.licoy.wdog.core.mapper.app.ActivityMemberMapper;
import cn.licoy.wdog.core.service.app.ActivityMemberService;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.service.app.SignupFormService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityMemberVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ActivityMemberServiceImpl extends ServiceImpl<ActivityMemberMapper,ActivityMember> implements ActivityMemberService {

    @Autowired
    private ActivityMemberMapper mapper;
    @Autowired
    private SysUserService userService;
    @Autowired
    private ActivityService activityService;
    @Autowired
    private SignupFormService signupFormService;


    /**
     * 活动已报名人数
     * @param actiId
     * @return
     */
    @Override
    public Integer getSignupNumByActiId(String actiId) {
        return mapper.getSignupNumByActiId(actiId);
    }

    /**
     * 用户是否报名
     *
     * @param checkDTO
     * @return
     */
    @Override
    public ActivityMemberVO checkState(ActivityMemberDTO checkDTO) {
        // 数据校验
        if(!activityService.isExistActivity(checkDTO.getActiId()) || !userService.isExist(checkDTO.getUid())){
            throw RequestException.fail("数据错误，活动ID或用户ID无效");
        }
        ActivityMemberVO vo = new ActivityMemberVO();
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("acti_id",checkDTO.getActiId()).and().eq("uid",checkDTO.getUid());
        ActivityMember activityMember = this.selectOne(wrapper);
        if (activityMember != null){
            BeanUtils.copyProperties(activityMember,vo);
        }else {
            BeanUtils.copyProperties(checkDTO,vo);
        }

        return vo;
    }

    /**
     * 报名、取消报名
     *
     * @param changeDTO
     */
    @Override
    public void changeState(ActivityMemberDTO changeDTO) {
        // 数据校验
        if(!activityService.isExistActivity(changeDTO.getActiId()) || !userService.isExist(changeDTO.getUid())){
            throw RequestException.fail("数据错误，活动ID或用户ID无效");
        }
        if(changeDTO.getId() == null){  //add
            ActivityMember add = new ActivityMember();
            BeanUtils.copyProperties(changeDTO,add);
            add.setCreateTime(new Date());
            add.setUid(userService.getCurrentUser().getId());
            this.insert(add);
            // 添加报名表单数据
            String signupData = changeDTO.getSignupData();
            String actiId = add.getActiId();
            String id = add.getId();
            signupFormService.add(signupData,actiId,id);
        }else{  //delete
            ActivityMember remove = this.selectById(changeDTO.getId());
            if(remove == null){
                throw RequestException.fail("取消失败，数据ID不存在");
            }
            signupFormService.deleteOne(changeDTO.getActiId(),remove.getId());
            this.deleteById(changeDTO.getId());
        }
    }

    /**
     * 获取用户参与的所有活动ID
     *
     * @param uid
     */
    @Override
    public List<String> getActiIdsByUid(String uid) {
        return this.mapper.getActiIdsByUid(uid);
    }
}
