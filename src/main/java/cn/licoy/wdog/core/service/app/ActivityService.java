package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdate;
import cn.licoy.wdog.core.entity.app.Activity;
import com.baomidou.mybatisplus.service.IService;

public interface ActivityService extends IService<Activity> {

    /**
     * 创建活动
     *
     * 获取主办方ID，当前用户信息，进行权限校验
     * 加载活动表单信息：
     *  input:标题，名额
     *  text: 描述
     *  datetime: 报名时段，进行时段
     *  picture:
     *  boolean:黑名单，人工审核
     *  ---
     *  groupId
     */
    void add (ActivityAddDTO addDTO);

    /**
     * 更新活动信息
     */
    void update (ActivityUpdate updateDTO);

    /**
     *
     */

}
