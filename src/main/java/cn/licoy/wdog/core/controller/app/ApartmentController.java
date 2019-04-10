package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.vo.app.MemberVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = {"/app/apartment"})
@Api(tags = {"部门管理"})
public class ApartmentController {

    @PostMapping(value = {"/member/list/{id}"})
    @ApiOperation(value = ("部门成员列表"))
    @SysLogs("部门成员列表")
    public ResponseResult memberList(@PathVariable("id") @ApiParam(value = "部门ID") String id){
        List<MemberVO> list = new ArrayList<>();

        for (int i=0;i<10;i++){
            MemberVO mem = new MemberVO();
            mem.setId("1111"+i);
            mem.setUsername("user"+i);
            list.add(mem);
        }
        return ResponseResult.e(ResponseCode.OK,list);
    }

    @PostMapping(value = {"/group/list/{id}"})
    @ApiOperation(value = ("分组列表"))
    @SysLogs("分组列表")
    public ResponseResult groupList(@PathVariable("id") @ApiParam(value = "部门ID") String id){
        String[] list = {"xiaoqiu","sun","sam","tony","scaliy","febob"};
        //获取所有用户分组，数据格式为
        // {groupName,groupId,children,}
        return ResponseResult.e(ResponseCode.OK,list);
    }
}
