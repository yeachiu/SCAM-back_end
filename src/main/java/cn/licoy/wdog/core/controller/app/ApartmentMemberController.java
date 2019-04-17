package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.apartment.ApartmentMemberDTO;
import cn.licoy.wdog.core.service.app.ApartmentMemberService;
import cn.licoy.wdog.core.service.app.ApartmentService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = {"/app/apartment/member"})
@Api(tags = {"部门成员管理"})
public class ApartmentMemberController {

    @Autowired
    private ApartmentMemberService memberService;
    @Autowired
    private ApartmentService apartmentService;

    @PostMapping(value = {"/list/{id}"})
    @ApiOperation(value = "获取部门列表")
    @SysLogs("获取部门成员列表")
    public ResponseResult list(@PathVariable @ApiParam(value = "部门ID") String id){
        return ResponseResult.e(ResponseCode.OK,memberService.list(id));
    }

    @PostMapping(value = {"/add"})
    @ApiOperation(value = "添加成员")
    @SysLogs("添加成员")
    public ResponseResult add(@RequestBody @Validated @ApiParam ApartmentMemberDTO addDTO){
        memberService.add(addDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/remove/{id}"})
    @ApiOperation(value = "删除成员")
    @SysLogs("删除成员")
    public ResponseResult remove(@PathVariable("id") @ApiParam("部门ID") String id){
        memberService.remove(id);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/get/id/{id}/{uid}"})
    @ApiOperation(value = ("部门成员信息"))
    @SysLogs("部门成员信息")
    public ResponseResult getById(@PathVariable("id") @ApiParam(value = "部门ID") String id, @PathVariable("id") @ApiParam(value = "成员ID") String uid){

        return ResponseResult.e(ResponseCode.OK,memberService.getById(id,uid));
    }
}
