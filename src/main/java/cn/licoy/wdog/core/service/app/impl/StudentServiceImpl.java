package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.student.FindStudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentUpdateDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.mapper.app.StudentMapper;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.app.StudentService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.StudentVO;
import cn.licoy.wdog.core.vo.app.GroupVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class StudentServiceImpl extends ServiceImpl<StudentMapper,Student> implements StudentService{

    @Autowired
    private AGroupService groupService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private StudentService studentService;

    @Override
    public Page<StudentVO> list(FindStudentDTO findStudentDTO) {
        List<StudentVO> studentVOList = new ArrayList<>();
        //1.获取所有符合的Student
        EntityWrapper<Student> wrapper = new EntityWrapper<>();
        wrapper.orderBy("stuNum",findStudentDTO.getAsc());
        List<Student> students = this.selectList(wrapper);
        if (students != null && students.size() > 0){
//            for (int i=0; i<students.size(); i++){
            for (Student stu : students) {
                //根据stu.groupId获取institute,profession,period,whatClass,className
                GroupVO groupVO = groupService.getGroupDetailById(stu.getGroupId());
                if (groupVO == null)
                    throw RequestException.fail("数据错误,获取ID为"+stu.getGroupId()+"的分组详情失败");
                StudentVO studentVO = new StudentVO();
                studentVO.setId(stu.getId());
                studentVO.setRealName(stu.getRealName());
                studentVO.setStuNum(stu.getStuNum());
                studentVO.setGroupVO(groupVO);
                studentVOList.add(studentVO);
            }
        }
        Page<StudentVO> studentPage = new Page<>(findStudentDTO.getPage(),findStudentDTO.getPageSize());
        studentPage.setRecords(studentVOList);
        return studentPage;
    }

    @Override
    public void add(StudentDTO dto) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("stuNum",dto.getStuNum());
        Student student = this.selectOne(wrapper);
        if (student != null)
            throw RequestException.fail(String.format("已经存在学号为%s的学生信息",dto.getStuNum()));
        //复制信息
        BeanUtils.copyProperties(dto,student);
        //匹配并SET学生分组信息
        AGroup group = new AGroup();
        BeanUtils.copyProperties(dto,group);
        String groupId = groupService.existGroup(group);
        if (groupId.equals(""))
            student.setGroupId(groupId);

        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        student.setCreateTime(new Date());
        student.setCreateUser(currentUser.getId());

        this.insert(student);

    }

    @Override
    public void update(String id, StudentDTO dto) {
        Student student = this.selectById(id);
        if (student == null)
            throw RequestException.fail("更新失败，不存在ID为" + id + "的学生信息");
        BeanUtils.copyProperties(dto,student);
        student.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        student.setModifyUser(currentUser.getId());
        this.updateById(student);
    }

    @Override
    public void remove(String id) {
        Student student = this.selectById(id);
        if (student == null)
            throw RequestException.fail("删除失败，不存在ID为" + id + "的学生信息");
        this.deleteById(id);
    }

    @Override
    public void update(String id, StudentUpdateDTO updateDTO) {
        Student student = this.selectById(id);
        if(student==null) throw RequestException.fail("学生信息不存在！");
        BeanUtils.copyProperties(updateDTO,student);
        try {
            this.updateById(student);
        }catch (Exception e){
            throw RequestException.fail("学生信息更新失败！",e);
        }
    }
}
