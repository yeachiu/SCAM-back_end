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
    List<ApartmentVO> list();

    /**
     * 删除部门
     * @param id
     */
    void remove(String id);
	
}
