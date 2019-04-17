package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.FindMemberDTO;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentMemberDTO;
import cn.licoy.wdog.core.entity.app.ApartmentMember;
import cn.licoy.wdog.core.mapper.app.ApartmentMemberMapper;
import cn.licoy.wdog.core.service.app.ActivityAdminsService;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.service.app.StudentService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import cn.licoy.wdog.core.vo.app.ApartmentMemberVO;
import cn.licoy.wdog.core.vo.app.StudentVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class ApartmentMemberServiceImpl extends ServiceImpl<ApartmentMemberMapper,ApartmentMember> implements ApartmentMemberService{

    @Autowired
    private StudentService studentService;
    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private ActivityAdminsService activityAdminsService;

    @Override
    public void add(ApartmentMemberDTO addDTO) {
        Boolean bool = studentService.existStudent(addDTO.getUid());
        if (!bool){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的学生信息",addDTO.getUid()));
        }
        bool = apartmentService.existApartment(addDTO.getAparId());
        if (!bool){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的部门信息",addDTO.getAparId()));
        }
        ApartmentMember member = new ApartmentMember();
        BeanUtils.copyProperties(addDTO,member);
        member.setIsadmin(ConstCode.FALSE);
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        member.setCreateTime(new Date());
        member.setCreateUser(currentUser.getId());
        this.insert(member);
    }

    @Override
    public void remove(String id) {
        ApartmentMember member = this.selectById(id);
        if (member == null)
            throw RequestException.fail("删除失败，不存在该关系");
        this.deleteById(id);

    }

    @Override
    public void update(String id, ApartmentMemberDTO updateDTO) {

    }

    @Override
    public Page<ApartmentMemberVO> list(FindMemberDTO findDTO) {
        Page<ApartmentMemberVO> apartmentMemberVOPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("apar_id",findDTO.getId());
        List<ApartmentMember> memberIds = this.selectList(wrapper);
        List<ApartmentMemberVO> members = new ArrayList<>();
        for (ApartmentMember mem: memberIds) {
            ApartmentMemberVO memVO = new ApartmentMemberVO();
            memVO.setCreateTime(mem.getCreateTime());
            StudentVO stu = studentService.getById(mem.getUid());
            if (stu != null)
                memVO.setMember(stu);
            List<ActivityAbstractVO> abstractList = activityAdminsService.findActiAbstractByAdminId(mem.getUid());
            if (abstractList != null && abstractList.size()>0){
                memVO.setActivities(abstractList);
            }
            members.add(memVO);
        }
        apartmentMemberVOPage.setRecords(members);

        return apartmentMemberVOPage;

    }
}

