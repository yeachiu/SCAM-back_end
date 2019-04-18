package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.app.Student;
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import cn.licoy.wdog.core.mapper.system.SysUserAuthMapper;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import cn.licoy.wdog.core.service.app.StudentService;
import cn.licoy.wdog.core.service.system.FindUserAuthDTO;
import cn.licoy.wdog.core.service.system.SysUserAuthService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class SysUserAuthServiceImpl extends ServiceImpl<SysUserAuthMapper,SysUserAuth> implements SysUserAuthService{


    @Autowired
    StudentService studentService;
    @Autowired
    SysUserAuthMapper mapper;

    @Override
    public List<SysUserAuth> list() {
        return this.selectList(new EntityWrapper<SysUserAuth>()
                .eq("status",ConstCode.USER_AUTH_INAUTH));
    }

    @Override
    public List<UserAuthVO> alreadyList() {
        List<UserAuthVO> userAuthVOList = mapper.alreadyList();
        if (userAuthVOList == null)   return null;
        return userAuthVOList;
    }

    @Override
    public Page<UserAuthVO> alreadyList(FindUserAuthDTO dto) {
        List<UserAuthVO> userAuthVOList = this.alreadyList();
        Page<UserAuthVO> authVOPage = new Page<>(dto.getPage(),dto.getPageSize());
        authVOPage.setRecords(userAuthVOList);
        return authVOPage;
    }

    @Override
    public List<UserAuthVO> UserAuthListExAdmin() {
        return null;
    }

    @Override
    public Integer selectAuthStatusByUid(String uid) {

        List<SysUserAuth> userAuths = this.selectList(new EntityWrapper<SysUserAuth>()
                .eq("uid",uid)
                .notIn("status",ConstCode.USER_AUTH_DELETE));
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
            userAuth.setStatus(ConstCode.USER_AUTH_DELETE);
            this.updateById(userAuth);
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
                .notIn("status",ConstCode.USER_AUTH_DELETE)
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
}
