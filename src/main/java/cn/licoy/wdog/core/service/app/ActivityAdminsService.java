package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityAdmins;
import com.baomidou.mybatisplus.service.IService;

public interface ActivityAdminsService extends IService<ActivityAdmins> {
	
	/**
     * 获取成员参与的活动简要信息
     */
    List<ActivityAbstractVO> findActiAbstractByAdminId(String uid);
}
