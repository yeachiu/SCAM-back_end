package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.activity.ActivityMemberDTO;
import cn.licoy.wdog.core.entity.app.ActivityMember;
import cn.licoy.wdog.core.vo.app.ActivityMemberVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;


public interface ActivityMemberService extends IService<ActivityMember> {

    /**
     * 获取活动已报名人数
     * @param actiId
     * @return
     */
	Integer getSignupNumByActiId (String actiId);

    /**
     * 用户是否报名
     * @param checckDTO
     */
    ActivityMemberVO checkState(ActivityMemberDTO checckDTO);

    /**
     * 报名、取消报名
     * @param changeDTO
     */
    void changeState(ActivityMemberDTO changeDTO);

    /**
     * 获取用户参与的所有活动ID
     */
    List<String> getActiIdsByUid(String uid);

}
