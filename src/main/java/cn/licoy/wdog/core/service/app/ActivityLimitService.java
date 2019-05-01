package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.vo.app.SimpleGroupVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ActivityLimitService extends IService<ActivityLimit> {

    /**
     * 活动分组列表
     * @param actiId
     * @return
     */
    List<SimpleGroupVO> findLimitByActiId(String actiId);

    /**
     * 某分组权限下的活动ID
     */
    List<String> findActiIdsByGroupId(String groupId);

    /**
     * 更新活动分组信息
     * @param actiId
     * @param groupId
     */
    void updateByActiId(String actiId, String groupId);

	
}
