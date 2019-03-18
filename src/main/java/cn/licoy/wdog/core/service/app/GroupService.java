package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.GroupDTO;
import cn.licoy.wdog.core.entity.app.Group;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface GroupService extends IService<Group> {

    /**
     * 获取分组列表
     * @return
     */
    List<Group> list();

    /**
     * 添加分组
     * @param dto
     */
    void add(GroupDTO dto);

    /**
     * 更新分组
     * @param id
     * @param dto
     */
    void update(String id,GroupDTO dto);

    /**
     * 删除分组
     * @param id
     */
    void remove(String id);
	
}
