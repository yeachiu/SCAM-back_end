package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.common.util.Tools;
import cn.licoy.wdog.core.entity.app.ScoreSetting;
import cn.licoy.wdog.core.mapper.app.ScoreSettingMapper;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.service.app.ScoreSettingService;
import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ScoreSettingServiceImpl extends ServiceImpl<ScoreSettingMapper,ScoreSetting> implements ScoreSettingService{

    @Autowired
    private ScoreSettingMapper mapper;
    @Autowired
    private ActivityService activityService;


    /**
     * 更新某个活动的学分设置数据
     *
     * @param actiId
     * @param jsonStrData
     */
    @Override
    public void updateByActiId(String actiId, String jsonStrData) {
        boolean exist = activityService.isExistActivity(actiId);
        if (!exist){
            throw RequestException.fail("获取失败，活动ID失效，请联系管理员");
        }
        //1.字符串数组转json对象数组
        if (!jsonStrData.equals("")){
            List<ScoreSetting> updateData = JSONArray.parseArray(jsonStrData,ScoreSetting.class);
            if (updateData == null && updateData.size()< 1){
                throw RequestException.fail("活动学分数据转换异常");
            }
            // 获取旧数据，用于对比
            List<ScoreSetting> oldData = this.getByActiId(actiId);

            try {
                //删除
                List<ScoreSetting> toDelete = Tools.deepCopy(oldData);
                toDelete.removeAll(updateData);
                //添加
                List<ScoreSetting> toAdd = Tools.deepCopy(oldData);
                toAdd.removeAll(oldData);
                //更新
                updateData.retainAll(oldData);

                System.out.println("===========================================DEBUG UPDATE=============================================================");
                System.out.println(toDelete.toString());
                System.out.println(toAdd.toString());
                System.out.println(updateData.toString());

                if (toDelete != null && toDelete.size()>0) {
                    List<String> idList = new ArrayList<>();
                    for(ScoreSetting score : toDelete){
                        idList.add(score.getId());
                    }
                    this.deleteBatchIds(idList);
                }
                if (toAdd != null && toAdd.size()>0)
                    this.insertBatch(toAdd);
                if (updateData != null && updateData.size()>0)
                    this.updateBatchById(updateData);

            } catch (IOException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    public List<ScoreSetting> getByActiId(String actiId) {

        boolean exist = activityService.isExistActivity(actiId);
        if (!exist){
            throw RequestException.fail("获取失败，活动ID失效，请联系管理员");
        }
        List<ScoreSetting> list = this.selectList(new EntityWrapper<ScoreSetting>().eq("aid",actiId));
        return list;
    }
}
