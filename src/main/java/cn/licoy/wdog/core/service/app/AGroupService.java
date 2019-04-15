package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.group.AGroupDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.vo.app.GroupVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface AGroupService extends IService<AGroup> {

    /**
     * 获取分组列表
     * @return
     */
    List<GroupVO> list();

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
    void update(String id,AGroupUpdateDTO dto);

    /**
     * 删除分组
     * @param id
     */
    void remove(String id);

    /**
     * 分组详情
     * @param id
     * @return
     */
    GroupVO getGroupDetailById (String id);

    /**
     * 匹配分组信息,返回ID
     * @param detail
     * @return
     */
    String getIdByDatail(ExistGroupDTO detail);

    /**
     * 是否存在分组
     * @param dto
     * @return
     */
    Boolean existGroup (ExistGroupDTO dto);
	
}
