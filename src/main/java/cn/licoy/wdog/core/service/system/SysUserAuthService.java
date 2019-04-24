package cn.licoy.wdog.core.service.system;

import cn.licoy.wdog.core.dto.system.user.FindUserAuthDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddByAdminDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.system.SysUserAuth;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface SysUserAuthService extends IService<SysUserAuth> {

    /**
     * 学生用户信息列表（不分页）
     *
     * @return
     */
    List<UserAuthVO> alreadyList();

    /**
     * 学生信息列表
     *
     * @return
     */
    Page<UserAuthVO> alreadyList(FindUserAuthDTO dto);

    /**
     * 审核列表
     */
    Page<UserAuthVO> inauthList(FindUserAuthDTO dto);

    /**
     * 排除部门管理员
     */
    List<UserAuthVO> alreadyListExAdmin();


    /**
     * 排除成员
     */
    List<UserAuthVO> alreadyListExMember();

    /**
     * 获取用户信息
     *
     * @param id
     * @return
     */
    UserAuthVO getById(String id);

    /***************************************************************************/

    /**
     * 学生身份认证
     */
    void studentAuth(UserAuthAddDTO dto);

    /**
     * 人工审核
     */
    void manualReview(UserAuthReviewDTO reviewDTO);

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
    Page<UserAuthVO> list(FindUserAuthDTO dto);

    /**
     * 验证用户信息
     */
    Boolean exist(String id);

    /**
     * 删除
     */
    void remove(String id);

    /**
     * 添加
     */
    void add(UserAuthAddDTO addDTO);

    void addByAdmin(UserAuthAddByAdminDTO addDTO);
}
