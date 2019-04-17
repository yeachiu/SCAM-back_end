package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.group.AGroupDTO;
import cn.licoy.wdog.core.dto.app.group.AGroupUpdateDTO;
import cn.licoy.wdog.core.dto.app.group.ExistGroupDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.mapper.app.AGroupMapper;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.system.SysDictionaryService;
import cn.licoy.wdog.core.service.system.SysUserService;
import cn.licoy.wdog.core.vo.app.GroupVO;
import cn.licoy.wdog.core.vo.system.DictionaryVO;
import cn.licoy.wdog.core.vo.system.SysUserVO;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
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
public class AGroupServiceImpl extends ServiceImpl<AGroupMapper,AGroup> implements AGroupService{

    @Autowired
    private SysDictionaryService dictionaryService;
    @Autowired
    private SysUserService userService;
    /**
     * 分组列表
     * @return
     */
    @Override
    public List<GroupVO> list() {
        EntityWrapper<AGroup> wrapper = new EntityWrapper<>();
        wrapper.orderBy("dictId");
        List<AGroup> groups = this.selectList(wrapper);
        List<GroupVO> groupVOs = new ArrayList<>();
        for (AGroup group: groups ) {
            GroupVO groupVO = new GroupVO();
            BeanUtils.copyProperties(group,groupVO);
            groupVO.setClassName(group.getName());
            //根据dictId查找institute/profession(parent的dictCode)
            if (group.getDictId() != null){
                groupVO.setDictId(group.getDictId());
                SysDictionary dict = dictionaryService.getDictNode(group.getDictId());
                if (dict == null){
                    throw RequestException.fail("数据错误，不存在ID为%s的组织机构字典");
                }
                if (dict.getParent() != null){
                    if (dict.getParent().getDictCode().equals("INSTITUTE")){//学院
                        groupVO.setInstitute(dict.getParent().getDictName());
                    }else{
                        groupVO.setProfession(dict.getDictName());
                        groupVO.setInstitute(dict.getParent().getDictName());
                    }
                }
            }

            groupVOs.add(groupVO);
        }
        return groupVOs;
    }

    /**
     * 根据DTO数据构建分组数据
     * 1.判断dictId,dictid-period单独的分组是否已存在，不存在则新增;
     * 2.根据classNum构建相应分组，同时根据各个字段拼接分组名称
     * @param dto
     */
    @Override
    public void add(AGroupDTO dto) {
        List<AGroup> addAGroups = new ArrayList<>();
        AGroup result = new AGroup();

        String dictName = dictionaryService.selectById(dto.getDictId()).getDictName();
        /** 是否存在学院专业分组*/
        AGroup institute = this.selectOne(new EntityWrapper<AGroup>()
                .eq("dict_id",dto.getDictId())
                .isNull("period,class_num,what_class"));
        if (institute == null) {
            institute = new AGroup();
            institute.setName(dictName);
            institute.setDictId(dto.getDictId());
            institute.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(institute);
        }
        /** 是否存在年级分组*/
        AGroup period = this.selectOne(new EntityWrapper<AGroup>()
                .eq("period",dto.getPeriod())
                .and()
                .isNull("dict_id,class_num,what_class"));
        if (period == null) {
            period = new AGroup();
            period.setName(dto.getPeriod() + ConstCode.PERIOD_NAME);
            period.setPeriod(dto.getPeriod());
            period.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(period);
        }
        /** 是否存在年级-学院专业分组*/
        AGroup institute_period = this.selectOne(new EntityWrapper<AGroup>()
                .eq("period",dto.getPeriod())
                .and()
                .eq("dict_id",dto.getDictId())
                .isNull("class_num,what_class"));
        if (institute_period == null) {
            institute_period = new AGroup();
            institute_period.setName(dto.getPeriod() + ConstCode.PERIOD_NAME + dictName);
            institute_period.setDictId(dto.getDictId());
            institute_period.setPeriod(dto.getPeriod());
            institute_period.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(institute_period);
        }
        /** 班级分组 */
        for (int i=0; i<dto.getClassNum(); i++){
            AGroup add = this.selectOne(new EntityWrapper<AGroup>()
                .eq("period",dto.getPeriod()).and()
                .eq("dict_id",dto.getDictId()).and()
                .eq("what_class",i+1));
            if (add == null){
                add = new AGroup();
                BeanUtils.copyProperties(dto,add);
                add.setTypeSymbol(ConstCode.SYMBOL_USER);
                add.setName(dto.getPeriod() + ConstCode.PERIOD_NAME + dictName + (i+1) + ConstCode.CLASS_NAME);
                add.setWhatClass(i + 1);
                addAGroups.add(add);
            }
        }
        //设置共同信息
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        for (int i = 0; i < addAGroups.size(); i++) {
            result = addAGroups.get(i);
            result.setCreateTime(new Date());
            result.setCreateUser(currentUser.getId());
        }
        this.insertBatch(addAGroups);

    }

    @Override
    public void update(String id, AGroupUpdateDTO dto) {
        AGroup group = this.selectById(id);
        if (group == null)
            throw RequestException.fail("更新失败，不存在ID为" + id + "的分组");
//        BeanUtils.copyProperties(dto,group);
        group.setName(dto.getClassName());
        group.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        group.setModifyUser(currentUser.getId());
        this.updateById(group);
    }

    @Override
    public void remove(String id) {
        AGroup group = this.selectOne(new EntityWrapper<AGroup>()
                .eq("id",id).setSqlSelect("id"));
        if (group == null)
            throw  RequestException.fail("删除失败，不存在ID为" + id + "的分组");
        this.deleteById(id);
    }

    /**
     * 获取institute,profession,period,whatClass,className
     * @param id
     * @return
     */
    @Override
    public GroupVO getGroupDetailById(String id) {
        GroupVO groupVO = new GroupVO();

        AGroup group = this.selectById(id);
//        if (group == null) {
//            throw RequestException.fail(String.format("数据错误，不存在ID为%s的分组", id));
//
//        }
        if (group != null){
            groupVO.setDictId(group.getDictId());
            SysDictionary dictionary = dictionaryService.getDictNode(group.getDictId());
            if (dictionary == null)
                throw  RequestException.fail(String.format("数据错误，不存在ID为%s的數字字典",group.getDictId()));

            BeanUtils.copyProperties(group,groupVO);
            groupVO.setClassName(group.getName());
            groupVO.setProfession(dictionary.getDictName());
            if (dictionary.getParent() != null)
                groupVO.setInstitute(dictionary.getDictName());
        }
        return groupVO;
    }

    @Override
    public Boolean existGroup(ExistGroupDTO groupSource) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("dict_id",groupSource.getDictId())
                .and()
                .eq("period",groupSource.getPeriod())
                .and()
                .eq("what_class",groupSource.getWhatClass());
        AGroup groupCompare = this.selectOne(wrapper);
        if (groupCompare == null)
            return false;
        return true;
    }

    @Override
    public String getIdByDatail(ExistGroupDTO groupSource) {
        EntityWrapper wrapper = new EntityWrapper();
        wrapper.eq("dict_id",groupSource.getDictId())
                .and()
                .eq("period",groupSource.getPeriod())
                .and()
                .eq("what_class",groupSource.getWhatClass());
        AGroup groupCompare = this.selectOne(wrapper);
        if (groupCompare == null) {
            RequestException.fail("暂未有对应用户分组，请先添加");
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> === 无法匹配分组");
            return "";
        }
//        groupCompare = this.selectOne(new EntityWrapper<AGroup>()
//                .eq("dict_id",groupSource.getDictId())
//                .isNull("period,class_num,what_class"));
//        if(groupCompare == null){
//            RequestException.fail("数据错误(不存在该dictId),请联系管理员处理");
//            return "";
//        }

        return groupCompare.getId();
    }
}
