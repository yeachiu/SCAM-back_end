package cn.licoy.wdog.core.service.system;

import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface SysUserAuthService extends IService<SysUserAuth> {

    /**
     * 学生身份认证
     */
    void studentAuth (UserAuthAddDTO dto);

    /**
     * 人工审核
     */
    void manualReview (UserAuthReviewDTO reviewDTO);

    /**
     * 认证撤销
     */
    void cancelStudentAuth(String authId);

    /**
     * 身份认证状态
     */
    Integer selectAuthStatusByUid(String uid);

    /**
     * 人工审核列表
     */
    List<SysUserAuth> list();

}
