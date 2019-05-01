package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.system.user.FindUserAuthDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddByAdminDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import cn.licoy.wdog.core.mapper.system.SysUserAuthMapper;
import cn.licoy.wdog.core.service.system.SysDictionaryService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.StudentVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import cn.licoy.wdog.core.service.app.StudentService;
import cn.licoy.wdog.core.service.system.SysUserAuthService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
@Transactional
public class SysUserAuthServiceImpl extends ServiceImpl<SysUserAuthMapper,SysUserAuth> implements SysUserAuthService{


    @Autowired
    private StudentService studentService;
    @Autowired
    private SysDictionaryService dictionaryService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private SysUserAuthMapper mapper;


    /** "认证中"状态的认证列表 **/
    @Override
    public Page<UserAuthVO> inauthList(FindUserAuthDTO dto) {
        Page<UserAuthVO> userAuthVOPage = new Page<UserAuthVO>(dto.getPage(),dto.getPageSize());
        userAuthVOPage.setRecords(mapper.inauthList());
        return userAuthVOPage;
    }

    /** 分页获取认证列表 **/
    @Override
    public Page<UserAuthVO> list(FindUserAuthDTO dto) {
        Page<UserAuthVO> userAuthVOPage = new Page<UserAuthVO>(dto.getPage(),dto.getPageSize());
        userAuthVOPage.setRecords(mapper.list());
        return userAuthVOPage;
    }

    /** "已认证"状态的认证列表 **/
    @Override
    public List<UserAuthVO> alreadyList() {
        List<UserAuthVO> userAuthVOList = mapper.alreadyList();
        if (userAuthVOList == null)   return null;
        return userAuthVOList;
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
        return mapper.getByUserId(uid);
    }

    /**************************************************************************************************/

    @Override
    public Integer selectAuthStatusByUid(String uid) {

        List<SysUserAuth> userAuths = this.selectList(new EntityWrapper<SysUserAuth>()
                .eq("uid",uid));
        if (userAuths.isEmpty() || userAuths.size() > 0){
            return ConstCode.USER_AUTH_UNAUTH;
        }
        return userAuths.get(0).getStatus();
    }

    @Override
    public void cancelStudentAuth(String authId) {
        SysUserAuth userAuth = this.selectById(authId);
        if (userAuth == null){
            throw RequestException.fail("不存在该认证信息");
        }
        if (userAuth.getStatus().equals(ConstCode.USER_AUTH_INAUTH)){
           this.deleteById(authId);
        }else{
            throw RequestException.fail("操作失败");
        }
    }

    @Override
    public void manualReview(UserAuthReviewDTO reviewDTO) {
        SysUserAuth userAuth = this.selectById(reviewDTO.getId());
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

    @Override
    public void studentAuth(UserAuthAddDTO authdto) {
        SysUserAuth userAuth = new SysUserAuth();
        boolean bool = false;
        // 是否已认证过：数据还未同步；
        List<SysUserAuth> userAuths = this.selectList(new EntityWrapper<SysUserAuth>()
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
            userAuth.setStatus(ConstCode.USER_AUTH_INAUTH);
            if (bool){
                this.updateById(userAuth);
            }else{
                this.insert(userAuth);
            }

            return;
        }
        //系统认证
//        Student student = students.get(0);
//        if (student.getProfession().equals(authdto.getProfession())
//                && student.getGrade().equals(authdto.getGrade())
//                && student.getStuClass().equals(authdto.getStuClass())){
//            BeanUtils.copyProperties(authdto,userAuth);
//            userAuth.setStatus(ConstCode.USER_AUTH_ALREADY);//认证成功
//            if (bool){
//                this.updateById(userAuth);
//            }else{
//                this.insert(userAuth);
//            }
//            return;
//        }else{
//            throw RequestException.fail("认证失败，请检查信息是否正确");
//        }
    }

//    private List<UserAuthVO> userAuthToVO(List<SysUserAuth> userAuths){
//        List<UserAuthVO> userAuthVOList = new ArrayList<>();
//        for (SysUserAuth userAuth : userAuths){
//            UserAuthVO userAuthVO = new UserAuthVO();
//            BeanUtils.copyProperties(userAuth,);
//        }
//    }


    @Override
    public Boolean exist(String id) {
        SysUserAuth userAuth = this.selectById(id);
        if (userAuth == null)
            return false;

        return true;
    }

    @Override
    public void remove(String id) {
        SysUserAuth userAuth = this.selectById(id);
        if (userAuth == null){
            throw RequestException.fail(String.format("删除失败，不存在ID为%s的认证记录"));
        }
        this.deleteById(id);
    }

    @Override
    public void add(UserAuthAddDTO addDTO) {
        SysDictionary dictionary = dictionaryService.selectById(addDTO.getDictId());
        if (dictionary == null){
            throw RequestException.fail(String.format("添加失败，不存在ID为%s的专业数据",addDTO.getDictId()));
        }
        SysUserAuth userAuth = new SysUserAuth();
        BeanUtils.copyProperties(addDTO,userAuth);
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        userAuth.setCreateTime(new Date());
        userAuth.setCreateUser(currentUser.getId());
        this.insert(userAuth);
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
        SysUserAuth userAuth = new SysUserAuth();
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
