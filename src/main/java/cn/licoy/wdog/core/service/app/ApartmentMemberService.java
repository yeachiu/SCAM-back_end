package cn.licoy.wdog.core.service.app;

import cn.licoy.wdog.common.service.BaseService;
import cn.licoy.wdog.core.entity.app.ApartmentMember;
import cn.licoy.wdog.core.vo.app.ApartmentMemberVO;
import cn.licoy.wdog.core.vo.app.MemberVO;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentMemberDTO;
import cn.licoy.wdog.core.dto.app.apartment.FindMemberDTO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

public interface ApartmentMemberService extends IService<ApartmentMember>,
        BaseService<ApartmentMemberVO,ApartmentMemberDTO,ApartmentMemberDTO,String,FindMemberDTO> {

    /**
     * 部门成员列表
     */
    List<ApartmentMemberVO> list(String id);

    /**
     * 部门成员信息
     */
    ApartmentMemberVO getById(String id, String uid);

    /**
     * 添加部门管理员
     */
    void addAdmin(String aparId, String uid);

    /**
     * 更新管理员信息
     */
    void updateAdmin(String aparId,String uid);

    /**
     * 删除部门所有成员信息
     */
    void deleteMembersByAparId(String aparId);

    /**
     * 其他管理员列表
     */
    List<MemberVO> listExcludeAdmin(String aparId);

}
