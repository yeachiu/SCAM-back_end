package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.entity.app.Apartment;
import cn.licoy.wdog.core.vo.app.ApartmentVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ApartmentService extends IService<Apartment> {

    /**
     * 获取分组列表
     * @return
     */
    Page<ApartmentVO> list(FindApartmentDTO findDTO);

    /**
     * 添加学生信息
     * @param dto
     */
    void add(ApartmentDTO dto);

    /**
     * 更新学生信息
     * @param id
     * @param dto
     */
    void update(String id,ApartmentDTO dto);
    /**
     * 删除部门
     * @param id
     */
    void remove(String id);
    
    /**
     * 验证部门信息
     */
    Boolean existApartment(String id);
    
    /**
     * 根据ID获取部门数据
     */
    ApartmentVO getById(String id);
}

