package cn.licoy.wdog.core.mapper.system;

import cn.licoy.wdog.core.entity.system.SysDictionary;
import cn.licoy.wdog.core.vo.system.DictionaryVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface SysDictionaryMapper extends BaseMapper<SysDictionary>  {


    @Select("SELECT a.id, a.parent_id AS parentId, a.dict_name AS dictName, a.dict_code AS dictCode FROM sys_dictionary a,sys_dictionary b WHERE a.parent_id = b.id AND b.parent_id = "+
            "(select id from sys_dictionary where dict_code = #{dictCode})")
    List<DictionaryVO> findByDictCode(String dictCode);

    @Select("SELECT dict.id, dict.parent_id AS parentId, dict.dict_name AS dictName, dict.dict_code AS dictCode FROM sys_dictionary dict WHERE parent_id = #{dictId};")
    List<DictionaryVO> selectVOList (String dictId);
}
