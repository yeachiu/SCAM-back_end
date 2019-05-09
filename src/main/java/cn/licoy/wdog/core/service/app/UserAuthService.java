package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.core.dto.app.student.FindUserAuthDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthAddByAdminDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.app.student.UserAuthReviewDTO;
import cn.licoy.wdog.core.entity.app.UserAuth;
import cn.licoy.wdog.core.vo.system.UserAuthVO;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface UserAuthService extends IService<UserAuth> {

    /**
     * 学生用户信息列表（不分页）
     * @return
     */
    List<UserAuthVO> alreadyList();

    /**
     * 学生信息列表
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
     * 根据认证ID获取VO
     * @param id
     * @return
     */
    UserAuthVO getById(String id);

    /**
     * 根据用户ID获取VO
     * @param uid
     * @return
     */
    UserAuthVO getByUserId(String uid);


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
     * 根据用户ID判断是否存在
     * @param uid
     * @return
     */
    Boolean existByUid(String uid);

    /**
     * 删除
     */
    void remove(String id);

    /**
     * 添加
     */
    void add(UserAuthAddDTO addDTO);

    /**
     * 管理员添加认证记录
     * @param addDTO
     */
    void addByAdmin(UserAuthAddByAdminDTO addDTO);

    /**
     * 获取学生所在分组
     */
    String getGroupIdByUserId(String userId);

}
