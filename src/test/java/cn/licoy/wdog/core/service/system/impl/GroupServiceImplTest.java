package cn.licoy.wdog.core.service.system.impl;

import cn.licoy.wdog.common.bean.ConstCode;
import cn.licoy.wdog.core.entity.app.AGroup;
import cn.licoy.wdog.core.service.app.AGroupService;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GroupServiceImplTest {

    @Autowired
    private AGroupService groupService;

    @Test
    public void getIdsTest(){
        List<String> list = groupService.findAllBelongGroupIds("1121060232340971522");
        System.out.println(list.toString());
    }

}