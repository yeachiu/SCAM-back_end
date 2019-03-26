package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.entity.app.Activity;
import cn.licoy.wdog.core.mapper.app.ActivityMapper;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.vo.app.ActivityVO;
import cn.licoy.wdog.core.vo.app.FindActivityDTO;
import cn.licoy.wdog.core.vo.app.StatusChangeDTO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ActivityServiceImpl extends ServiceImpl<ActivityMapper,Activity> implements ActivityService{

    /**
     * 活动列表
     * @param findActivityDTO 过滤条件
     * @return
     * #过滤取消状态#
     */
    @Override
    public Page<ActivityVO> getAllActivityBySplitPage(FindActivityDTO findActivityDTO) {
        return null;
    }

    /**
     * 活动列表(回收站)
     * @param findActivityDTO
     * @return
     */
    @Override
    public Page<ActivityVO> getCancelActivityBySplitPage(FindActivityDTO findActivityDTO){
        return null;
    }
    /**
     * 更改状态
     * @param statusChangeDTO
     *
     */
    @Override
    public void statusChange(StatusChangeDTO statusChangeDTO){

    }

    @Override
    public void add(ActivityAddDTO addDTO) {
//        Activity findActivity = this.selectOne(new EntityWrapper<Activity>().eq("title",addDTO.getTitle()));
//        if(findActivity != null){
//            throw RequestException.fail(
//                    String.format("已经存在用户名为 %s 的用户",addDTO.getTitle()));
//        }
//        findActivity = new Activity();
//        BeanUtils.copyProperties(addDTO,findActivity);
        System.out.println("======================= addDTO:" + addDTO.toString());

    }

    @Override
    public void update(String id,ActivityUpdateDTO updateDTO) {

    }

    @Override
    public void cancel(String id) {

    }

    @Override
    public void publish(String id) {

    }
}
