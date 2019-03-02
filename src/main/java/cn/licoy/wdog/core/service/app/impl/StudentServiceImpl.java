package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.mapper.app.StudentMapper;
import cn.licoy.wdog.core.service.app.StudentService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class StudentServiceImpl extends ServiceImpl<StudentMapper,Student> implements StudentService{
	
}
