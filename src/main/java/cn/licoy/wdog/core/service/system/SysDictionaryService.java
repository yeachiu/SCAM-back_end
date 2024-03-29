package cn.licoy.wdog.core.service.system;

import cn.licoy.wdog.core.dto.system.dictionary.DictionaryDTO;
import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.vo.system.DictionaryVO;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;
import java.util.Map;

public interface SysDictionaryService extends IService<SysDictionary> {

    /**
     * 字典信息，包括父节点、子集
     * @param id
     * @return
     */
    SysDictionary getDictNode (String id);

    /**
     * 获取资源列表
     * @return
     */
    List<SysDictionary> list();

    /**
     * 根据代码获取子列表
     * @param dictCode
     * @return
     */
    List<DictionaryVO> listByCode(String dictCode);

    /**
     * 添加资源
     * @param dto
     */
    void add(DictionaryDTO dto);

    /**
     * 更新资源
     * @param id
     * @param dto
     */
    void update(String id,DictionaryDTO dto);

    /**
     * 删除资源
     * @param id
     */
    void remove(String id);

    /**
     * 递归查找所有的子集
     * @param dictionary
     */
    void findAllChild(SysDictionary dictionary);

    /**
     * 递归查找所有的子集
     * @param dictionary
     */
    void findAllVOChild(DictionaryVO dictionary);

    /**
     * 递归查找父结点
     * @param dictionary
     */
    void findParent(SysDictionary dictionary);



    /**
     * 获取资源所有的父级
     * @param Dictionary 资源
     * @param cacheMap 缓存对象
     * @param cacheMap2 缓存对象
     * @return 资源
     */
    SysDictionary getDictionaryAllParent(SysDictionary Dictionary,Map<String,SysDictionary> cacheMap,
                                     Map<String,SysDictionary> cacheMap2);
	
}
