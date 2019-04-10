package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.dto.app.activity.StatusChangeDTO;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

public interface ActivityService extends IService<Activity> {

    /**
     * 活动列表
     */
    /**
     * 获取所有用户（分页）
     * @param findActivityDTO 过滤条件
     */
    Page<ActivityVO> getAllActivityBySplitPage(FindActivityDTO findActivityDTO);

    /**
     * 活动列表(回收站)
     */
    Page<ActivityVO> getCancelActivityBySplitPage(FindActivityDTO findActivityDTO);

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
    void update (String id,ActivityUpdateDTO updateDTO);

    /**
     * 删除活动/取消活动
     */
    void cancel(String id);

    /**
     * 发布活动
     */
    void publish(String id);

    /**
     * 修改活动状态
     * @param statusChangeDTO
     */
    void statusChange(StatusChangeDTO statusChangeDTO);

}
