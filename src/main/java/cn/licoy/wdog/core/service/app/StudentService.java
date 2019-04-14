package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.common.service.BaseService;
import cn.licoy.wdog.core.dto.app.student.FindStudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentUpdateDTO;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.vo.StudentVO;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;


public interface StudentService extends IService<Student> ,
        BaseService<StudentVO,StudentDTO,StudentUpdateDTO,String,FindStudentDTO> {

    /**
     * 学生信息列表
     * @return
     */
    Page<StudentVO> list(FindStudentDTO dto);

    /**
     * 添加学生信息
     * @param dto
     */
    void add(StudentDTO dto);

    /**
     * 更新学生信息
     * @param id
     * @param dto
     */
    void update(String id,StudentDTO dto);

    /**
     * 删除学生信息
     * @param id
     */
    void remove(String id);
}
