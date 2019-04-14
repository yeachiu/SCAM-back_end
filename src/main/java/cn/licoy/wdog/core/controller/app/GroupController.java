package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.group.AGroupDTO;
import cn.licoy.wdog.core.service.app.AGroupService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = "/app/group")
@Api(tags = {"分组管理"})
public class GroupController {

    @Autowired
    AGroupService groupService;

    @PostMapping(value = {"/list"})
    @ApiOperation(value = "获取所有的分组列表")
    @SysLogs("获取所有的分组列表")
    public ResponseResult list(){
        return ResponseResult.e(ResponseCode.OK,groupService.list());
    }

    @PostMapping(value = {"/add"})
    @ApiOperation(value = "添加分组")
    @SysLogs("添加分组")
    public ResponseResult add(@RequestBody @Validated @ApiParam("分组数据") AGroupDTO dto){
        groupService.add(dto);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/update/{id}"})
    @ApiOperation(value = "添加分组")
    @SysLogs("添加分组")
    public ResponseResult update(@PathVariable("id") @ApiParam("分组ID") String id,
                                 @RequestBody @Validated @ApiParam("分组数据") AGroupDTO dto){
        groupService.update(id,dto);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/remove/{id}"})
    @ApiOperation(value = "删除分组")
    @SysLogs("删除分组")
    public ResponseResult remove(@PathVariable("id") @ApiParam("分组ID") String id){
        groupService.remove(id);
        return ResponseResult.e(ResponseCode.OK);
    }
}
