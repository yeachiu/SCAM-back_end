package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.vo.app.GroupSelectVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AGroupMapper extends BaseMapper<AGroup>  {

    @Select("SELECT g.`name` AS title, g.id, g.dict_id FROM a_group g WHERE g.parent_id = 'ROOT'")
    List<GroupSelectVO> listByRoot();

    @Select("SELECT g.`name` AS title, g.id, g.dict_id FROM a_group g WHERE g.parent_id = 'PERIOD'")
    List<GroupSelectVO> listByPeriod();

    @Select("SELECT son.`name` AS title , son.id, son.dict_id FROM a_group dad, a_group  son WHERE dad.id = son.parent_id AND dad.id = #{id}")
    List<GroupSelectVO> findChildren(String id);

    @Select("SELECT g.`name` AS title, g.id, g.dict_id FROM a_group g WHERE g.class_num IS NOT NULL AND g.dict_id = #{dictId} AND g.period = #{period}")
    List<GroupSelectVO> listByDictIdAndPeriod(@Param("dictId") String dictId, @Param("period") Integer period);
}
