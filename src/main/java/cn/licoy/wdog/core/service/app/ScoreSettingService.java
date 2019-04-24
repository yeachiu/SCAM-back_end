package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.ScoreSetting;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ScoreSettingService extends IService<ScoreSetting> {

    /**
     * 获取活动学分设置信息
     */
    List<ScoreSetting> getByActiId(String actiId);

    /**
     * 更新某个活动的学分设置数据
     */
    void updateByActiId(String actiId, String jsonStrData);



}
