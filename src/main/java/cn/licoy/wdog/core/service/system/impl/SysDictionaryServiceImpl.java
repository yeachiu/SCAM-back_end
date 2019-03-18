package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.common.exception.RequestException;
import cn.licoy.wdog.core.dto.system.dictionary.DictionaryDTO;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.mapper.system.SysDictionaryMapper;
import cn.licoy.wdog.core.service.global.ShiroService;
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
import java.util.Map;

@Service
@Transactional
public class SysDictionaryServiceImpl extends ServiceImpl<SysDictionaryMapper,SysDictionary> implements SysDictionaryService{


    @Autowired
    private SysUserService userService;

    @Override
    public List<SysDictionary> list() {
        EntityWrapper<SysDictionary> wrapper = new EntityWrapper<>();
        wrapper.eq("parent_id","ROOT")
                .or()
                .isNull("parent_id")
                .orderBy("sort");
        List<SysDictionary> dictionaries = this.selectList(wrapper);
        if (dictionaries != null && dictionaries.size() > 0){
            dictionaries.forEach(this::findAllChild);
        }
        return dictionaries;
    }

    @Override
    public void add(DictionaryDTO dto) {
        SysDictionary dictionary = new SysDictionary();
        BeanUtils.copyProperties(dto, dictionary);
        dictionary.setCreateTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        dictionary.setCreateUser(currentUser.getId());
        this.insert(dictionary);
    }

    @Override
    public void update(String id, DictionaryDTO dto) {
        SysDictionary dictionary = this.selectById(id);
        if (dictionary == null)
            throw RequestException.fail("更新失败，不存在ID为" + id + "的字典条目");
        BeanUtils.copyProperties(dto,dictionary);
        dictionary.setModifyTime(new Date());
        SysUserVO currentUser = userService.getCurrentUser();
        if (currentUser == null)
            throw RequestException.fail("添加失败because获取用户信息失败");
        dictionary.setModifyUser(currentUser.getId());
        this.updateById(dictionary);
    }

    @Override
    public void remove(String id) {
        SysDictionary dictionary = this.selectOne(new EntityWrapper<SysDictionary>()
                .eq("id",id).setSqlSelect("id"));
        if (dictionary == null)
            throw RequestException.fail("删除失败，不存在ID为" + id + "的字典条目");
        this.deleteById(id);
    }

    @Override
    public void findAllChild(SysDictionary dictionary) {
        EntityWrapper<SysDictionary> wrapper = new EntityWrapper<>();
        wrapper.eq("parent_id",dictionary.getId()).orderBy("sort");
        List<SysDictionary> dictionaries = this.selectList(wrapper);
        dictionary.setChildren(dictionaries);
        if (dictionaries != null && dictionaries.size() > 0){
            dictionaries.forEach(this::findAllChild);
        }
    }

    @Override
    public SysDictionary getDictionaryAllParent(SysDictionary dictionary, Map<String, SysDictionary> cacheMap, Map<String, SysDictionary> cacheMap2) {
        if (dictionary.getParentId() != null && !"".equals(dictionary.getParentId().trim())){
            SysDictionary cacheParent = cacheMap.get(dictionary.getParentId());
            SysDictionary parent;
            if (cacheParent != null){
                parent = cacheParent;
            }else{
                cacheParent = cacheMap2.get(dictionary.getParentId());
                if (cacheParent != null){
                    parent = cacheParent;
                }else{
                    parent = this.selectById(dictionary.getParentId());
                }
            }
            if (parent != null){
                if (parent.getChildren() == null){
                    parent.setChildren(new ArrayList<>());
                }
                //判断是否已经包含此对象
                if (!parent.getChildren().contains(dictionary)){
                    parent.getChildren().add(dictionary);
                }
                if (parent.getParentId() != null && !"".equals(parent.getParentId().trim())){
                    return getDictionaryAllParent(parent,cacheMap,cacheMap2);
                }else {
                    return parent;
                }
            }

        }

        return dictionary;
    }
}
