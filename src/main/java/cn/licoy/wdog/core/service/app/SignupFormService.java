package cn.licoy.wdog.core.service.app;

import java.util.List;

public interface SignupFormService {

    /**
     * 添加报名数据
     * @param data
     * @param actiId
     * @param id
     */
    void add(String data,String actiId,String id);

    /**
     * 活动报名数据列表
     * @param actiId
     * @return
     */
    List<String> list(String actiId);

    /**
     * 查询单条记录
     * @param actiId
     * @param id
     * @return
     */
    String selectOne(String actiId,String id);

    /**
     * 更新记录
     * @param actiId
     * @param updateData
     */
    void updateById(String actiId,String updateData);

    /**
     * 清空集合
     */
    void deleteAll(String actiId);

    /**
     * 删除单条记录
     * @param actiId
     * @param id
     */
    void deleteOne(String actiId, String id);

}