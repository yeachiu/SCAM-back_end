package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.Student;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StudentMapper extends BaseMapper<Student>  {

    @Select("SELECT * FROM student WHERE id NOT IN (SELECT uid FROM apartment_member WHERE isadmin = 0)")
    List<Student> excludeAparAdmin();
}
