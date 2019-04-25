package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.dto.app.activity.StatusChangeDTO;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ActivityService extends IService<Activity> {

    /**
     * 某部门活动列表
     */
    Page<ActivityVO> getAllActivityByAparId(FindActivityDTO findDTO);


    /**
     * 活动列表(回收站)
     */
    Page<ActivityVO> getCancelActivityBySplitPage(FindActivityDTO findActivityDTO);

    /**
     * 创建活动
     */
    void add (ActivityAddDTO addDTO);

    /**
     * 更新活动信息
     */
    void update (String id,ActivityUpdateDTO updateDTO);

    /**
     * 删除活动
     */
    void remove(String id);

    /**
     * 发布活动
     */
    void publish(String id);

    /**
     * 修改活动状态
     * @param statusChangeDTO
     */
    void statusChange(StatusChangeDTO statusChangeDTO);
    
    /**
     * 获取单个活动简要信息
     */
    ActivityAbstractVO getAbstractById(String id);

    /**
     * 活动是否存在
     */
    Boolean isExistActivity(String id);
}
