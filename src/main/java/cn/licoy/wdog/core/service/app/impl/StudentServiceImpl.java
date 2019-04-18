package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.group.ExistGroupDTO;
import cn.licoy.wdog.core.dto.app.student.FindStudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentUpdateDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.mapper.app.StudentMapper;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
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
    private ApartmentMemberService memberService;
    @Autowired
    private StudentMapper mapper;

    @Override
    public List<StudentVO> allList() {
        List<Student> students = this.selectList(new EntityWrapper<Student>());
        if (students == null)   return null;
        return this.studentToVO(students);
    }

    @Override
    public Page<StudentVO> list(FindStudentDTO findStudentDTO) {
        List<StudentVO> studentVOList = this.allList();
        Page<StudentVO> studentPage = new Page<>(findStudentDTO.getPage(),findStudentDTO.getPageSize());
        studentPage.setRecords(studentVOList);
        return studentPage;
    }

    @Override
    public List<StudentVO> studentListExAdmin() {
        List<Student> students = mapper.excludeAparAdmin();
        if (students == null)   return null;
        return this.studentToVO(students);
    }

    @Override
    public void add(StudentDTO dto) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("stu_num",dto.getStuNum());
        Student student = this.selectOne(wrapper);
        if (student != null)
            throw RequestException.fail(String.format("已经存在学号为%s的学生信息",dto.getStuNum()));
        //复制信息
        student = new Student();
        BeanUtils.copyProperties(dto,student);
        //匹配并SET学生分组信息
        ExistGroupDTO group = new ExistGroupDTO();
        BeanUtils.copyProperties(dto,group);
        String groupId = groupService.getIdByDatail(group);
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
        //匹配并SET学生分组信息
        ExistGroupDTO group = new ExistGroupDTO();
        BeanUtils.copyProperties(dto,group);
        String groupId = groupService.getIdByDatail(group);
        student.setGroupId(groupId);
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
        //匹配并SET学生分组信息
        ExistGroupDTO group = new ExistGroupDTO();
        BeanUtils.copyProperties(updateDTO,group);
        String groupId = groupService.getIdByDatail(group);
        student.setGroupId(groupId);
        student.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        student.setModifyUser(currentUser.getId());
        try {
            this.updateById(student);
        }catch (Exception e){
            throw RequestException.fail("学生信息更新失败！",e);
        }
    }

    @Override
    public Boolean existStudent(String id) {
        Student student = this.selectById(id);
        if(student==null)
            return false;
        return true;
    }

    @Override
    public StudentVO getById(String id) {
        Student student = this.selectById(id);
        if (student == null){
            throw RequestException.fail(String.format("获取信息失败,不存在ID为%s的学生信息",id));
        }

        //根据stu.groupId获取institute,profession,period,whatClass,className
        GroupVO groupVO = groupService.getGroupDetailById(student.getGroupId());
        if (groupVO == null) {
            groupVO = new GroupVO();
            throw RequestException.fail("数据错误,获取ID为" + student.getGroupId() + "的分组详情失败");
        }
        StudentVO studentVO = new StudentVO();
        studentVO.setId(student.getId());
        studentVO.setRealName(student.getRealName());
        studentVO.setStuNum(student.getStuNum());
        studentVO.setGroupVO(groupVO);
        return studentVO;
    }

    private List<StudentVO> studentToVO(List<Student> students){
        List<StudentVO> studentVOList = new ArrayList<>();
        for (Student stu : students) {
            //根据stu.groupId获取institute,profession,period,whatClass,className
            GroupVO groupVO = groupService.getGroupDetailById(stu.getGroupId());
            if (groupVO == null) {
                groupVO = new GroupVO();
                throw RequestException.fail("数据错误,获取ID为" + stu.getGroupId() + "的分组详情失败");
            }
            StudentVO studentVO = new StudentVO();
            studentVO.setId(stu.getId());
            studentVO.setRealName(stu.getRealName());
            studentVO.setStuNum(stu.getStuNum());
            studentVO.setGroupVO(groupVO);
            studentVOList.add(studentVO);
        }
        return studentVOList;
    }
}
