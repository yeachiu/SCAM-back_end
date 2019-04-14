package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Apartment;
import cn.licoy.wdog.core.mapper.app.ApartmentMapper;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.vo.app.ApartmentVO;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ApartmentServiceImpl extends ServiceImpl<ApartmentMapper,Apartment> implements ApartmentService{

    @Override
    public List<ApartmentVO> list() {
        return null;
    }

    @Override
    public void remove(String id) {

    }
}
