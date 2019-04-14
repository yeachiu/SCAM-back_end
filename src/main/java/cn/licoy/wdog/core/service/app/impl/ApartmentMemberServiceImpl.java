package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.ApartmentMember;
import cn.licoy.wdog.core.mapper.app.ApartmentMemberMapper;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ApartmentMemberServiceImpl extends ServiceImpl<ApartmentMemberMapper,ApartmentMember> implements ApartmentMemberService{
	
}
