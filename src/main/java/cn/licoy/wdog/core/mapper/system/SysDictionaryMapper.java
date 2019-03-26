package cn.licoy.wdog.core.mapper.system;

import cn.licoy.wdog.core.entity.system.SysDictionary;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import org.apache.catalina.mapper.Constants;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface SysDictionaryMapper extends BaseMapper<SysDictionary>  {


    @Select("select * from sys_dictionary dict where parent_id = " +
            "(select id from sys_dictionary where dictCode = #{dictCode})")
    List<SysDictionary> findByDictCode(String dictCode);
}
