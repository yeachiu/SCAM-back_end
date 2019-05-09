package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.activity.*;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.vo.app.SimpleActivityVO;
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
     * 获取单个活动信息(详细)
     */
    ActivityVO getById(String id);

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

    /**
     * 活动是否有效(结束或删除)
     */
    Boolean isEffective(String id);

    /**
     * 获取用户权限下所有活动信息
     * @param userId
     * @return
     */
    List<ActivityAbstractVO> getByUserId(String userId);

    /**
     * 获取用户参与的所有活动数据
     * @param userId
     * @return
     */
    List<ActivityAbstractVO> getJoinInByUserId(String userId);

    /**
     * 获取用户关注的所有活动数据
     * @param userId
     * @return
     */
    List<ActivityAbstractVO> getFocusByUserId(String userId);

    /**
     * 获取所有有效活动数据
     * @return
     */
    List<ActivityAbstractVO> getAllEffectiveActivity();

    /**
     * 根据活动状态获取数据
     */
    List<SimpleActivityVO> getSimpleListByStatus(SimpleActivityDTO dto);
}
