package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentDTO;
import cn.licoy.wdog.core.dto.app.apartment.FindApartmentDTO;
import cn.licoy.wdog.core.entity.app.Apartment;
import cn.licoy.wdog.core.mapper.app.ApartmentMapper;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.service.app.UserAuthService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.ApartmentVO;
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

@Service
@Transactional
public class ApartmentServiceImpl extends ServiceImpl<ApartmentMapper,Apartment> implements ApartmentService{

    @Autowired
    private UserAuthService authService;
    @Autowired
    private SysUserService userService;
    @Autowired
    private ApartmentMemberService memberService;

    @Override
    public Page<ApartmentVO> list(FindApartmentDTO findDTO) {
        List<ApartmentVO> apartmentVOList = new ArrayList<>();

        List<Apartment> apartments = this.selectList(new EntityWrapper<Apartment>().orderBy("create_time",findDTO.getAsc()));
        if (apartments != null && apartments.size()>0){
            for (Apartment apar: apartments ) {
                UserAuthVO apartAdmin = authService.getByUserId(apar.getApartAdmin());
                ApartmentVO apartmentVO = new ApartmentVO();
                BeanUtils.copyProperties(apar,apartmentVO);
                apartmentVO.setApartAdmin(apartAdmin);
                apartmentVOList.add(apartmentVO);
            }
        }
        Page<ApartmentVO> apartmentPage = new Page<>(findDTO.getPage(),findDTO.getPageSize());
        apartmentPage.setRecords(apartmentVOList);
        return apartmentPage;

    }

    @Override
    public void add(ApartmentDTO dto) {
        Boolean existStudent = authService.existByUid(dto.getApartAdmin());
        if (!existStudent){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的认证用户",dto.getApartAdmin()));
        }
        Apartment apartment = new Apartment();
        BeanUtils.copyProperties(dto,apartment);
        //时间和操作者
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        apartment.setCreateTime(new Date());
        apartment.setCreateUser(currentUser.getId());
        this.insert(apartment);

        memberService.addAdmin(apartment.getId(),dto.getApartAdmin());

    }

    @Override
    public void update(String id, ApartmentDTO dto) {
        Apartment apartment = this.selectById(id);
        if (apartment == null){
            throw RequestException.fail(String.format("更新失败，不存在ID为%s的部门信息",id));
        }
        Boolean existStudent = authService.existByUid(dto.getApartAdmin());
        if (!existStudent){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的认证用户",dto.getApartAdmin()));
        }

        BeanUtils.copyProperties(dto,apartment);
        apartment.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        apartment.setModifyUser(currentUser.getId());
        //更新成员信息
        memberService.updateAdmin(apartment.getId(),dto.getApartAdmin());
        this.updateById(apartment);
    }

    @Override
    public void remove(String id) {
        Apartment apartment = this.selectById(id);
        if(apartment == null)
            throw RequestException.fail(String.format("删除失败，不存在ID为%s的学生信息",id));
        //删除所有部门成员信息
        memberService.deleteMembersByAparId(id);
        this.deleteById(id);
    }

    @Override
    public Boolean existApartment(String id) {
        Apartment apartment = this.selectById(id);
        if (apartment == null){
            return false;
        }
        return true;
    }

    @Override
    public ApartmentVO getById(String id) {
        Apartment apartment = this.selectById(id);
        if (apartment == null){
            throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门信息",id));
        }
        UserAuthVO apartAdmin = authService.getByUserId(apartment.getApartAdmin());
        ApartmentVO apartmentVO = new ApartmentVO();
        BeanUtils.copyProperties(apartment,apartmentVO);
        apartmentVO.setApartAdmin(apartAdmin);
        return apartmentVO;
    }
}
