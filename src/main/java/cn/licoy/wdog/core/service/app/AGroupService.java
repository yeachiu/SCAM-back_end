package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.AGroupDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface AGroupService extends IService<AGroup> {

    /**
     * 获取分组列表
     * @return
     */
    List<AGroup> list();

    /**
     * 添加分组
     * @param dto
     */
    void add(AGroupDTO dto);

    /**
     * 更新分组
     * @param id
     * @param dto
     */
    void update(String id,AGroupDTO dto);

    /**
     * 删除分组
     * @param id
     */
    void remove(String id);
	
}
