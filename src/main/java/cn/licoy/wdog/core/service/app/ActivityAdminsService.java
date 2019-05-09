package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityAdmins;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ActivityAdminsService extends IService<ActivityAdmins> {
	
	/**
     * 获取成员参与的活动简要信息
     */
    List<ActivityAbstractVO> findActiAbstractByAdminId(String uid);

    /**
     * 更新活动管理员信息
     * @param actiId
     * @param otherAdmin
     */
    void updateByActiId(String actiId, String otherAdmin);

    /**
     * 清除无效活动数据
     * @param actiId
     */
    void removeAllByActiId(String actiId);
}
