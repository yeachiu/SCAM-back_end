package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.core.dto.app.group.ExistGroupDTO;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.entity.app.UserAuth;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.app.UserAuthService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

/**
 * 程序目标：
 *  为目前sys_user_auth数据表中完成认证的用户信息添加所属的groupId
 *      根据用户提交的认证表单信息，与分组表a_group的数据进行匹配
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class FixUserAuthDataTool {

    @Autowired
    private UserAuthService authService;
    @Autowired
    private AGroupService groupService;

    @Test
    public void runThis(){
        List<UserAuth> userlist = authService.selectList(new EntityWrapper<UserAuth>()
            .eq("status",ConstCode.USER_AUTH_ALREADY));
        AGroup group = new AGroup();
        for(UserAuth user : userlist){
            EntityWrapper wrapper = new EntityWrapper();
            wrapper.eq("dict_id",user.getDictId()).and()
                    .eq("period",user.getPeriod()).and()
                    .eq("what_class",user.getWhatClass());
            group = groupService.selectOne(wrapper);
            System.out.printf("用户 %s (学生 %s )属于分组名为 %s 的小组",user.getUid(),user.getRealName(),group.getName());
            if (group != null){
                user.setGroupId(group.getId());
                authService.updateById(user);
            }
        }
    }

}