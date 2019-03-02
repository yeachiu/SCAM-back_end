package cn.licoy.wdog.core.mapper.system;

import cn.licoy.wdog.core.entity.system.SysUserAuth;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface SysUserAuthMapper extends BaseMapper<SysUserAuth> {

}