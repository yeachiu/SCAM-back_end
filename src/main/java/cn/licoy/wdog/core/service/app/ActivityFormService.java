package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ActivityForm;
import com.baomidou.mybatisplus.service.IService;

public interface ActivityFormService extends IService<ActivityForm> {

    /**
     * 获取活动报名表规则
     * @param actiId
     * @return
     */
    ActivityForm getByActiId(String actiId);

    /**
     * 添加表单规则
     * @param actiId
     * @param rules
     */
    void add(String actiId,String rules);

    /**
     * 更新某个活动的学分设置数据
     */
    void updateByActiId(String actiId, String rules);
	
}
