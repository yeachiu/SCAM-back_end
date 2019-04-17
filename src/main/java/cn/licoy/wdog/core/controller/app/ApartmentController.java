package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentDTO;
import cn.licoy.wdog.core.dto.app.apartment.FindApartmentDTO;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import cn.licoy.wdog.core.service.app.ApartmentService;
import cn.licoy.wdog.core.vo.app.MemberVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping(value = {"/app/apartment"})
@Api(tags = {"部门管理"})
public class ApartmentController {

    @Autowired
    private ApartmentService apartmentService;
    @Autowired
    private ApartmentMemberService memberService;

    @PostMapping(value = {"/list"})
    @ApiOperation(value = "获取部门列表")
    @SysLogs("获取部门列表")
    public ResponseResult list(FindApartmentDTO findApartmentDTO){
        return ResponseResult.e(ResponseCode.OK,apartmentService.list(findApartmentDTO));
    }

    @PostMapping(value = {"/add"})
    @ApiOperation(value = "添加部门")
    @SysLogs("添加部门")
    public ResponseResult add(@RequestBody @Validated @ApiParam ApartmentDTO apartmentDTO){
        apartmentService.add(apartmentDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/update/{id}"})
    @ApiOperation(value = "更新部门信息")
    @SysLogs("更新部门信息")
    public ResponseResult update(@PathVariable("id") @ApiParam(value = "部门ID") String id,@RequestBody @ApiParam(value = "部门信息") ApartmentDTO apartmentDTO){
        apartmentService.update(id,apartmentDTO);
        return ResponseResult.e(ResponseCode.OK);
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

    @PostMapping(value = {"/remove/{id}"})
    @ApiOperation(value = "删除资源")
    @SysLogs("删除资源")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult remove(@PathVariable("id") @ApiParam("资源ID") String id){
        apartmentService.remove(id);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/get/id/{id}"})
    @ApiOperation(value = ("部门成员列表"))
    @SysLogs("部门成员列表")
    public ResponseResult getById(@PathVariable("id") @ApiParam(value = "部门ID") String id){

        return ResponseResult.e(ResponseCode.OK,apartmentService.getById(id));
    }
}
