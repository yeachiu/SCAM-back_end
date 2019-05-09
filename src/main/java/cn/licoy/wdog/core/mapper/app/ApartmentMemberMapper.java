package cn.licoy.wdog.core.mapper.app;

import cn.licoy.wdog.core.entity.app.ApartmentMember;
import cn.licoy.wdog.core.vo.app.MemberVO;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ApartmentMemberMapper extends BaseMapper<ApartmentMember>  {

    @Select("SELECT a.uid AS id, a.real_name AS realName FROM apartment_member m, user_auth a WHERE m.uid = a.uid AND m.apar_id = #{aparId}")
    List<MemberVO> listExcludeAdmin(String aparId);





}
