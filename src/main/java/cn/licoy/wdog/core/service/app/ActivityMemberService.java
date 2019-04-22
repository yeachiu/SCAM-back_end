package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityMember;
import com.baomidou.mybatisplus.service.IService;

public interface ActivityMemberService extends IService<ActivityMember> {
	
	Integer getSignupNumByActiId (String actiId);
	
}
