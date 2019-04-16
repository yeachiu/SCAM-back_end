package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.core.entity.app.Apartment;
import cn.licoy.wdog.core.mapper.app.ApartmentMapper;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.vo.app.ApartmentVO;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ApartmentServiceImpl extends ServiceImpl<ApartmentMapper,Apartment> implements ApartmentService{

    @Override
    public List<ApartmentVO> list() {
        return null;
    }

    @Autowired
    private StudentService studentService;
    @Autowired
    private SysUserService userService;

    @Override
    public Page<ApartmentVO> list(FindApartmentDTO findDTO) {
        List<ApartmentVO> apartmentVOList = new ArrayList<>();

        List<Apartment> apartments = this.selectList(new EntityWrapper<Apartment>().orderBy("create_time",findDTO.getAsc()));
        if (apartments != null && apartments.size()>0){
            for (Apartment apar: apartments ) {
                StudentVO apartAdmin = studentService.getById(apar.getApartAdmin());
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
        Boolean existStudent = studentService.existStudent(dto.getApartAdmin());
        if (!existStudent){
            throw RequestException.fail(String.format("数据错误，不存在ID为%s的学生",dto.getApartAdmin()));
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

    }

    @Override
    public void update(String id, ApartmentDTO dto) {
        Apartment apartment = this.selectById(id);
        if (apartment == null){
            throw RequestException.fail(String.format("更新失败，不存在ID为%s的部门信息",id));
        }
        Boolean existStudent = studentService.existStudent(dto.getApartAdmin());
        if (existStudent){
            throw RequestException.fail("数据错误，不存在ID为%s的学生");
        }
        BeanUtils.copyProperties(dto,apartment);
        apartment.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        apartment.setModifyUser(currentUser.getId());
        this.updateById(apartment);
    }

    @Override
    public void remove(String id) {
        Apartment apartment = this.selectById(id);
        if(apartment == null)
            throw RequestException.fail(String.format("删除失败，不存在ID为%s的学生信息"));
        this.deleteById(id);
    }

    @Override
    public ApartmentVO getById(String id) {
        Apartment apartment = this.selectById(id);
        if (apartment == null){
            throw RequestException.fail(String.format("数据获取失败，不存在ID为%s的部门信息",id));
        }
        StudentVO apartAdmin = studentService.getById(apartment.getApartAdmin());
        ApartmentVO apartmentVO = new ApartmentVO();
        BeanUtils.copyProperties(apartment,apartmentVO);
        apartmentVO.setApartAdmin(apartAdmin);
        return apartmentVO;
    }
    @Override
    public void remove(String id) {

    }
}
