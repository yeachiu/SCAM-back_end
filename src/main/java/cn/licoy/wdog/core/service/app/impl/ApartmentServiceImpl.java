package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Apartment;
import cn.licoy.wdog.core.mapper.app.ApartmentMapper;
import cn.licoy.wdog.core.service.app.ApartmentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ApartmentServiceImpl extends ServiceImpl<ApartmentMapper,Apartment> implements ApartmentService{
	
}
