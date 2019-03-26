package cn.licoy.wdog.core.service.app.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.app.AGroupDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.mapper.app.AGroupMapper;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.system.SysDictionaryService;
import cn.licoy.wdog.core.service.system.SysUserService;
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
    public List<AGroup> list() {
        EntityWrapper<AGroup> wrapper = new EntityWrapper<>();
        wrapper.orderBy("dictId");
        List<AGroup> groups = this.selectList(wrapper);

        return groups;
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
        AGroup add = new AGroup();
        String dictName = dictionaryService.selectById(dto.getDictId()).getDictName();
        /** 是否存在学院专业分组*/
        result = this.selectOne(new EntityWrapper<AGroup>()
                .eq("dict_id",dto.getDictId())
                .isNull("period,class_num,what_class"));
        if (result == null) {
            add.setName(dictName);
            add.setDictId(dto.getDictId());
            add.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(add);
        }
        /** 是否存在年级分组*/
        result = this.selectOne(new EntityWrapper<AGroup>()
                .eq("period",dto.getPeriod())
                .and()
                .isNull("dict_id,class_num,what_class"));
        if (result == null) {
            add.setName(dto.getPeriod() + ConstCode.PERIOD_NAME);
            add.setPeriod(dto.getPeriod());
            add.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(add);
        }
        /** 是否存在年级-学院专业分组*/
        result = this.selectOne(new EntityWrapper<AGroup>()
                .eq("period",dto.getPeriod())
                .and()
                .eq("dict_id",dto.getDictId())
                .isNull("class_num,what_class"));
        if (result == null) {
            add.setName(dto.getPeriod() + ConstCode.PERIOD_NAME + dictName);
            add.setDictId(dto.getDictId());
            add.setPeriod(dto.getPeriod());
            add.setTypeSymbol(ConstCode.SYMBOL_USER);
            addAGroups.add(add);
        }
        /** 班级分组 */
        BeanUtils.copyProperties(dto,add);
        add.setTypeSymbol(ConstCode.SYMBOL_USER);
        for (int i=0; i<dto.getClassNum(); i++){
            add.setName(dto.getPeriod() + ConstCode.PERIOD_NAME + dictName + (i+1) + ConstCode.CLASS_NAME);
            add.setWhatClass(i + 1);
            addAGroups.add(add);
        }
        //设置共同信息
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        for (int i = 0; i < addAGroups.size(); i++) {
            add = addAGroups.get(i);
            add.setCreateTime(new Date());
            add.setCreateUser(currentUser.getId());
        }
        this.insertBatch(addAGroups);

    }

    @Override
    public void update(String id, AGroupDTO dto) {
        AGroup group = this.selectById(id);
        if (group == null)
            throw RequestException.fail("更新失败，不存在ID为" + id + "的分组");
        BeanUtils.copyProperties(dto,group);
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
}
