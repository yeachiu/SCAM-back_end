package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.student.FindUserAuthDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthAddByAdminDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.entity.app.UserAuth;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.entity.system.SysUserRole;
import cn.licoy.wdog.core.mapper.app.UserAuthMapper;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.app.UserAuthService;
import cn.licoy.wdog.core.service.system.SysDictionaryService;
import cn.licoy.wdog.core.service.system.SysUserRoleService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.StudentVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import cn.licoy.wdog.core.service.app.StudentService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class UserAuthServiceImpl extends ServiceImpl<UserAuthMapper,UserAuth> implements UserAuthService{

    @Autowired
    private AGroupService groupService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private SysDictionaryService dictionaryService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private SysUserRoleService userRoleService;
    @Autowired
    private UserAuthMapper mapper;


    /** "认证中"状态的认证列表 **/
    @Override
    public Page<UserAuthVO> inauthList(FindUserAuthDTO dto) {
        Page<UserAuthVO> userAuthVOPage = new Page<UserAuthVO>(dto.getPage(),dto.getPageSize());
        List<UserAuthVO> voList = new ArrayList<>();
        List<UserAuth> list = this.selectList(new EntityWrapper<UserAuth>().eq("status",1).orderBy("create_time"));
        voList = userAuthToVO(list);
        userAuthVOPage.setRecords(voList);
        return userAuthVOPage;
    }

    /** 分页获取认证列表 **/
    @Override
    public Page<UserAuthVO> list(FindUserAuthDTO dto) {
        Page<UserAuthVO> userAuthVOPage = new Page<UserAuthVO>(dto.getPage(),dto.getPageSize());
        List<UserAuthVO> voList = new ArrayList<>();
        List<UserAuth> list = this.selectList(new EntityWrapper<UserAuth>().orderBy("create_time"));
        voList = userAuthToVO(list);
        userAuthVOPage.setRecords(voList);
        return userAuthVOPage;
    }

    /** "已认证"状态的认证列表 **/
    @Override
    public List<UserAuthVO> alreadyList() {

        List<UserAuthVO> voList = new ArrayList<>();
        List<UserAuth> list = this.selectList(new EntityWrapper<UserAuth>().eq("status",2).orderBy("create_time"));
        voList = userAuthToVO(list);
        return voList;
    }

    /** "已认证"状态的认证列表(分页) **/
    @Override
    public Page<UserAuthVO> alreadyList(FindUserAuthDTO dto) {
        List<UserAuthVO> userAuthVOList = this.alreadyList();
        Page<UserAuthVO> authVOPage = new Page<>(dto.getPage(),dto.getPageSize());
        authVOPage.setRecords(userAuthVOList);
        return authVOPage;
    }

    /** 认证用户列表，排除部门管理员 **/
    @Override
    public List<UserAuthVO> alreadyListExAdmin() {
        List<UserAuthVO> userAuthVOList = mapper.alreadyListExAdmin();
        if (userAuthVOList == null)   return null;
        return userAuthVOList;
    }

    /** 认证用户列表，排除部门成员 **/
    @Override
    public List<UserAuthVO> alreadyListExMember() {
        List<UserAuthVO> userAuthVOList = mapper.alreadyListExMember();
        if (userAuthVOList == null)   return null;
        return userAuthVOList;
    }

    /** 根据ID获取认证信息 **/
    @Override
    public UserAuthVO getById(String id) {
        UserAuthVO userAuthVO = mapper.getById(id);
        return userAuthVO;
    }

    /** 根据用户ID获取认证信息 **/
    @Override
    public UserAuthVO getByUserId(String uid) {
        UserAuth userAuth = this.selectOne(new EntityWrapper<UserAuth>().eq("uid",uid));
        UserAuthVO vo = new UserAuthVO();
        if(userAuth != null){
            BeanUtils.copyProperties(userAuth,vo);
            if (userAuth.getGroupId() != null && !userAuth.getGroupId().equals("")){
                AGroup group = groupService.selectById(userAuth.getGroupId());
                if (group != null)
                    vo.setClassName(group.getName());
            }
            SysDictionary dict = dictionaryService.selectById(userAuth.getDictId());
            if (dict != null){
                vo.setProfession(dict.getDictName());
            }
        }

        return vo;
    }

    /**************************************************************************************************/

    @Override
    public Integer selectAuthStatusByUid(String uid) {

        List<UserAuth> userAuths = this.selectList(new EntityWrapper<UserAuth>()
                .eq("uid",uid));
        if (userAuths.isEmpty() || userAuths.size() > 0){
            return ConstCode.USER_AUTH_UNAUTH;
        }
        return userAuths.get(0).getStatus();
    }

    /** 用户取消认证 **/
    @Override
    public void cancelStudentAuth(String authId) {
        UserAuth userAuth = this.selectById(authId);
        if (userAuth == null){
            throw RequestException.fail("不存在该认证信息");
        }
        if (userAuth.getStatus().equals(ConstCode.USER_AUTH_INAUTH)){
            userRoleService.remove(userAuth.getUid(),ConstCode.AUTH_USER);
            this.deleteById(authId);
        }else{
            throw RequestException.fail("操作失败");
        }
    }

    /** 人工审核 **/
    @Override
    public void manualReview(UserAuthReviewDTO reviewDTO) {
        UserAuth userAuth = this.selectById(reviewDTO.getId());
        if (userAuth == null){
            throw RequestException.fail("不存在该认证信息");
        }
        if (!userAuth.getStatus().equals(ConstCode.USER_AUTH_INAUTH)){
            throw RequestException.fail("数据异常");
        }
        if (reviewDTO.getStatus().equals(ConstCode.USER_AUTH_ALREADY)
                ||reviewDTO.getStatus().equals(ConstCode.USER_AUTH_FAIL)){
            userAuth.setStatus(reviewDTO.getStatus());
            this.updateById(userAuth);
        }else{
            throw RequestException.fail("操作失败");
        }
    }

    /** 学生认证(系统studentAuth) **/
    @Override
    public void studentAuth(UserAuthAddDTO authdto) {
        UserAuth userAuth = new UserAuth();
        boolean bool = false;
        // 是否已认证过：数据还未同步；
        List<UserAuth> userAuths = this.selectList(new EntityWrapper<UserAuth>()
                .eq("uid",authdto.getUid())
        );

        if (!userAuths.isEmpty() && userAuths.size() > 0){
            bool = true;
            userAuth = userAuths.get(0);
            if (userAuth.getStatus() == ConstCode.USER_AUTH_INAUTH){
                throw RequestException.fail("学生身份认证中，请耐心等待");
            }else if (userAuth.getStatus() == ConstCode.USER_AUTH_ALREADY){
                throw RequestException.fail(String.format("用户 %s 已完成认证",userAuths.get(0).getRealName()));
            }else if (userAuth.getStatus() != ConstCode.USER_AUTH_FAIL){
                throw RequestException.fail("数据发生错误，请联系管理员！");
            }

        }

        //根据姓名和学号检索学生信息
        Map<String,Object> params = new HashMap<>();
        params.put("real_name",authdto.getRealName());
        params.put("stu_num",authdto.getStuNum());
        List<Student> students = studentService.selectList(new EntityWrapper<Student>().allEq(params));
        if (students == null || students.size() == 0){
            //转人工认证
            BeanUtils.copyProperties(authdto,userAuth);
            userAuth.setDictId(authdto.getProfession());
            AGroup group = groupService.selectById(authdto.getClassName());
            if(group!= null){
                userAuth.setWhatClass(group.getWhatClass());
                userAuth.setGroupId(group.getId());
            }
            userAuth.setStatus(ConstCode.USER_AUTH_INAUTH);
            if (bool){
                userAuth.setModifyTime(new Date());
                userAuth.setModifyUser(userService.getCurrentUser().getId());
                this.updateById(userAuth);
            }else{
                userAuth.setCreateTime(new Date());
                userAuth.setCreateUser(userService.getCurrentUser().getId());
                this.insert(userAuth);
                //为用户设置角色
                SysUserRole userRole = new SysUserRole();
                userRole.setRid(ConstCode.AUTH_USER);
                userRole.setUid(userAuth.getUid());
                userRoleService.add(userRole);

            }

            return;
        }
        //系统认证
        Student student = students.get(0);
        if (student.getGroupId().equals(authdto.getClassName())){
            BeanUtils.copyProperties(authdto,userAuth);
            userAuth.setStuId(student.getId());
            userAuth.setDictId(authdto.getProfession());
            userAuth.setGroupId(authdto.getClassName());
            AGroup group = groupService.selectById(authdto.getClassName());
            if(group!= null){
                userAuth.setWhatClass(group.getWhatClass());
            }
            userAuth.setStatus(ConstCode.USER_AUTH_ALREADY);//认证成功
            if (bool){
                userAuth.setModifyTime(new Date());
                userAuth.setModifyUser(userService.getCurrentUser().getId());
                this.updateById(userAuth);
            }else{
                userAuth.setCreateTime(new Date());
                userAuth.setCreateUser(userService.getCurrentUser().getId());
                this.insert(userAuth);
                //为用户设置角色
                SysUserRole userRole = new SysUserRole();
                userRole.setRid(ConstCode.AUTH_USER);
                userRole.setUid(userAuth.getUid());
                userRoleService.add(userRole);
            }
            return;
        }else{
            throw RequestException.fail("认证失败，请检查信息是否正确");
        }
    }

    private List<UserAuthVO> userAuthToVO(List<UserAuth> userAuths){
        List<UserAuthVO> userAuthVOList = new ArrayList<>();
        for (UserAuth userAuth : userAuths){
            UserAuthVO userAuthVO = new UserAuthVO();
            BeanUtils.copyProperties(userAuth,userAuthVO);
            SysDictionary dictionary = dictionaryService.getDictNode(userAuth.getDictId());
            if (dictionary != null){
                userAuthVO.setProfession(dictionary.getDictName());
            }
            EntityWrapper wrapper = new EntityWrapper();
            wrapper.eq("dict_id",userAuth.getDictId()).and()
                    .eq("period",userAuth.getPeriod()).and()
                    .eq("what_class",userAuth.getWhatClass());
            AGroup group = groupService.selectOne(wrapper);
            if(group!= null){
                userAuthVO.setClassName(group.getName());
            }
            userAuthVOList.add(userAuthVO);
        }
        return userAuthVOList;
    }

    @Override
    public Boolean exist(String id) {
        UserAuth userAuth = this.selectById(id);
        if (userAuth == null)
            return false;

        return true;
    }

    @Override
    public Boolean existByUid(String uid) {
        UserAuth userAuth = this.selectOne(new EntityWrapper<UserAuth>().eq("uid",uid));
        if (userAuth == null)
            return false;

        return true;
    }

    @Override
    public void remove(String id) {
        UserAuth userAuth = this.selectById(id);
        if (userAuth == null){
            throw RequestException.fail(String.format("删除失败，不存在ID为%s的认证记录"));
        }
        // 移除权限（角色）
        userRoleService.remove(userAuth.getUid(),ConstCode.AUTH_USER);
        this.deleteById(id);
    }

    @Override
    public void add(UserAuthAddDTO addDTO) {
        UserAuth userAuth = new UserAuth();
        BeanUtils.copyProperties(addDTO,userAuth);
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        userAuth.setCreateTime(new Date());
        userAuth.setCreateUser(currentUser.getId());
        this.insert(userAuth);
        //为用户设置角色
        SysUserRole userRole = new SysUserRole();
        userRole.setRid(ConstCode.AUTH_USER);
        userRole.setUid(userAuth.getUid());
        userRoleService.add(userRole);
    }

    @Override
    public void addByAdmin(UserAuthAddByAdminDTO addDTO) {
        Boolean bool = userService.isExist(addDTO.getUid());
        if(!bool)
            throw RequestException.fail("不存在该用户");
        bool = studentService.existStudent(addDTO.getStuId());
        if(!bool)
            throw RequestException.fail("不存在该学生信息");
        StudentVO studentVO = studentService.getById(addDTO.getStuId());
        UserAuth userAuth = new UserAuth();
        userAuth.setStatus(ConstCode.USER_AUTH_ALREADY);
        userAuth.setDictId(studentVO.getGroupVO().getDictId());
        userAuth.setPeriod(studentVO.getGroupVO().getPeriod());
        userAuth.setRealName(studentVO.getRealName());
        userAuth.setStuId(studentVO.getId());
        userAuth.setStuNum(studentVO.getStuNum());
        userAuth.setWhatClass(studentVO.getGroupVO().getWhatClass());
        userAuth.setUid(addDTO.getUid());
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        userAuth.setCreateTime(new Date());
        userAuth.setCreateUser(currentUser.getId());
        this.insert(userAuth);
        //为用户设置角色
        SysUserRole userRole = new SysUserRole();
        userRole.setRid(ConstCode.AUTH_USER);
        userRole.setUid(userAuth.getUid());
        userRoleService.add(userRole);
    }

    /**
     * 获取学生所在分组
     *
     * @param userId
     */
    @Override
    public String getGroupIdByUserId(String userId) {
        return this.mapper.getGroupIdByUserId(userId);
    }
}
