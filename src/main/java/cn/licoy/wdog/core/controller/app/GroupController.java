package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.group.AGroupDTO;
import cn.licoy.wdog.core.dto.app.group.AGroupUpdateDTO;
import cn.licoy.wdog.core.dto.app.group.ExistGroupDTO;
import cn.licoy.wdog.core.service.app.AGroupService;
import cn.licoy.wdog.core.service.app.impl.FindClazzDTO;
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

    @PostMapping(value = {"/list/profession"})
    @ApiOperation(value = "获取所有专业")
    @SysLogs("获取所有专业")
    public ResponseResult findAllProfession() {
        return ResponseResult.e(ResponseCode.OK,groupService.findAllProfession());
    }

    @PostMapping(value = {"/list/clazz"})
    @ApiOperation(value = "获取所有专业")
    @SysLogs("获取所有专业")
    public ResponseResult findBydictIdAndPeriod(@RequestBody @Validated @ApiParam(value = "专业和年级") FindClazzDTO findClazzDTO) {
        return ResponseResult.e(ResponseCode.OK,groupService.findBydictIdAndPeriod(findClazzDTO));
    }

    @PostMapping(value = {"/list/format"})
    @ApiOperation(value = "获取部门分组列表")
    @SysLogs("获取所有的分组列表")
    public ResponseResult listToSelect(){
        return ResponseResult.e(ResponseCode.OK,groupService.listToSelect());
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
                                 @RequestBody @Validated @ApiParam("分组数据") AGroupUpdateDTO dto){
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
    
    @PostMapping(value = {"/exist"})
    @ApiOperation(value = "删除分组")
    @SysLogs("删除分组")
    public ResponseResult existGroup(@RequestBody @Validated @ApiParam("分组数据") ExistGroupDTO dto){
        return ResponseResult.e(ResponseCode.OK,groupService.existGroup(dto));
    }
}
