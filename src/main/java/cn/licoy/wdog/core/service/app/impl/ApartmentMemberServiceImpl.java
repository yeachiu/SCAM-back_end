package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentMemberDTO;
import cn.licoy.wdog.core.dto.app.apartment.FindMemberDTO;
import cn.licoy.wdog.core.entity.app.ApartmentMember;
import cn.licoy.wdog.core.entity.system.SysUserRole;
import cn.licoy.wdog.core.mapper.app.ApartmentMemberMapper;
import cn.licoy.wdog.core.service.app.ActivityAdminsService;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.service.app.UserAuthService;
import cn.licoy.wdog.core.service.system.SysRoleService;
import cn.licoy.wdog.core.service.system.SysUserRoleService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ActivityAbstractVO;
import cn.licoy.wdog.core.vo.app.ApartmentMemberVO;
import cn.licoy.wdog.core.vo.app.MemberVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
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
import java.util.Map;

@Service
@Transactional
public class ApartmentMemberServiceImpl extends ServiceImpl<ApartmentMemberMapper,ApartmentMember> implements ApartmentMemberService{

    @Autowired
    private UserAuthService authService;
    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private ActivityAdminsService activityAdminsService;
    @Autowired
    private SysUserRoleService userRoleService;
    @Autowired
    private ApartmentMemberMapper mapper;


    /**
     * 添加成员
     * 为成员添加对应权限角色（部门成员）
     * @param addDTO
     */
    @Override
    public void add(ApartmentMemberDTO addDTO) {
        Boolean bool = authService.exist(addDTO.getUid());
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
        //为成员设置角色
        SysUserRole userRole = new SysUserRole();
        userRole.setRid(ConstCode.APAR_MEMBER);
        userRole.setUid(member.getUid());
        userRoleService.add(userRole);
    }

    @Override
    public void remove(String id) {
        ApartmentMember member = this.selectById(id);
        if (member == null)
            throw RequestException.fail("删除失败，不存在该关系");
        if (member.getIsadmin().equals(ConstCode.TRUE))
            throw RequestException.fail("该成员为部门管理员，不允许删除");
        // 移除权限（角色）
        userRoleService.remove(member.getUid(),ConstCode.APAR_MEMBER);
        this.deleteById(id);

    }

    @Override
    public void update(String id, ApartmentMemberDTO updateDTO) { }

    @Override
    public Page<ApartmentMemberVO> list(FindMemberDTO findDTO) {
        Page<ApartmentMemberVO> apartmentMemberVOPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        List<ApartmentMemberVO> members = this.list(findDTO.getId());
        apartmentMemberVOPage.setRecords(members);
        return apartmentMemberVOPage;
    }

    @Override
    public List<ApartmentMemberVO> list(String id) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("apar_id",id);
        List<ApartmentMember> apartmentMembers = this.selectList(wrapper);
        List<ApartmentMemberVO> members = new ArrayList<>();
        for (ApartmentMember mem: apartmentMembers) {
            ApartmentMemberVO apartmentMemberVO = new ApartmentMemberVO();
            BeanUtils.copyProperties(mem,apartmentMemberVO);
            UserAuthVO userAuthVO = authService.getByUserId(mem.getUid());
            if (userAuthVO != null)
                apartmentMemberVO.setMember(userAuthVO);
            List<ActivityAbstractVO> abstractList = activityAdminsService.findActiAbstractByAdminId(mem.getUid());
            if (abstractList != null && abstractList.size()>0){
                apartmentMemberVO.setActivities(abstractList);
            }
            members.add(apartmentMemberVO);
        }
        return members;
    }

    @Override
    public ApartmentMemberVO getById(String id, String uid) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("apar_id",id).and().eq("uid",uid);
        ApartmentMember member = this.selectOne(wrapper);
        if (member == null)
            throw RequestException.fail(String.format("获取数据失败，不存在ID为%s的成员",uid));

        ApartmentMemberVO apartmentMemberVO = new ApartmentMemberVO();
        BeanUtils.copyProperties(member,apartmentMemberVO);
        //获取成员身份数据
        UserAuthVO stu = authService.getByUserId(member.getUid());
        if (stu != null)
            apartmentMemberVO.setMember(stu);
        //获取成员相关的活动数据
        List<ActivityAbstractVO> abstractList = activityAdminsService.findActiAbstractByAdminId(member.getUid());
        if (abstractList != null && abstractList.size()>0){
            apartmentMemberVO.setActivities(abstractList);
        }
        return apartmentMemberVO;
    }

    @Override
    public void addAdmin(String aparId, String uid) {
        Boolean bool = authService.exist(uid);
        if (!bool){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的认证用户",uid));
        }
        ApartmentMember member = new ApartmentMember();
        member.setAparId(aparId);
        member.setUid(uid);
        member.setIsadmin(ConstCode.TRUE);
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        member.setCreateTime(new Date());
        member.setCreateUser(currentUser.getId());
        this.insert(member);
        //为成员设置角色
        SysUserRole userRole = new SysUserRole();
        userRole.setRid(ConstCode.APAR_ADMIN);
        userRole.setUid(member.getUid());
        userRoleService.add(userRole);
    }

    @Override
    public void updateAdmin(String aparId, String uid) {
        Boolean bool = authService.existByUid(uid);
        if (!bool){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的认证用户",uid));
        }
        ApartmentMember oldAdmin = this.selectOne(new EntityWrapper<ApartmentMember>().
                eq("apar_id",aparId).and().eq("isadmin",ConstCode.TRUE));
        if (oldAdmin == null){
            throw  RequestException.fail(String.format("数据错误，找不到ID为%s的部门中ID为%s的管理员信息",aparId,uid));
        }
        //1.新管理员为原部门成员 ==> 调换二者的isadmin状态
        //2.新管理员为新成员 ==> 原管理员更改isadmin状态，添加新管理员
        ApartmentMember member = this.selectOne(new EntityWrapper<ApartmentMember>().
                eq("apar_id",aparId).and().eq("uid",uid));
        if (member != null){
            member.setIsadmin(ConstCode.TRUE);
            oldAdmin.setIsadmin(ConstCode.FALSE);
            List<ApartmentMember> updateList = new ArrayList<>();
            updateList.add(member);
            updateList.add(oldAdmin);
            this.updateBatchById(updateList);
            //为成员更新角色
            SysUserRole userRole = userRoleService.selectOne(new EntityWrapper<SysUserRole>().eq("uid",member.getUid()));
            if (userRole != null){
                userRole.setRid(ConstCode.APAR_ADMIN);
                userRoleService.update(userRole);
            }
            userRole = userRoleService.selectOne(new EntityWrapper<SysUserRole>().eq("uid",oldAdmin.getUid()));
            if (userRole != null){
                userRole.setRid(ConstCode.APAR_MEMBER);
                userRoleService.update(userRole);
            }

        }else{
            oldAdmin.setIsadmin(ConstCode.FALSE);
            SysUserRole userRole = userRoleService.selectOne(new EntityWrapper<SysUserRole>().eq("uid",oldAdmin.getUid()));
            if (userRole != null){
                userRole.setRid(ConstCode.APAR_MEMBER);
                userRoleService.update(userRole);
            }
            this.updateById(oldAdmin);
            this.addAdmin(aparId,uid);
        }

    }

    @Override
    public void deleteMembersByAparId(String aparId) {
        Boolean bool = apartmentService.existApartment(aparId);
        if (!bool){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的部门信息",aparId));
        }
        List<ApartmentMember> members = this.selectList(new EntityWrapper<ApartmentMember>().eq("apar_id",aparId));
        for (ApartmentMember mem : members) {
            userRoleService.removeByUid(mem.getUid());
        }
        this.delete(new EntityWrapper<ApartmentMember>().eq("apar_id",aparId));
    }

    @Override
    public List<MemberVO> listExcludeAdmin(String aparId) {
        List<MemberVO> members = this.mapper.listExcludeAdmin(aparId);
        return members;
    }
}

