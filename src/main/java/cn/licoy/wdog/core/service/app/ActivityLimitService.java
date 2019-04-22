package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityLimit;
import cn.licoy.wdog.core.vo.app.SimpleAGroupVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ActivityLimitService extends IService<ActivityLimit> {

    /**
     * 活动分组列表
     * @param actiId
     * @return
     */
    List<SimpleAGroupVO> findLimitByActiId(String actiId);
	
}
