package cn.licoy.wdog.core.controller.system;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.system.user.FindUserAuthDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddByAdminDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.service.system.SysUserAuthService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(value = {"/system/user/auth"})
@Api(tags = {"用户管理"})
public class UserAuthController {

    @Autowired
    private SysUserAuthService userAuthService;

    @PostMapping(value = {"/add"})
    @ApiOperation(value = ("学生认证"))
    @SysLogs("学生身份认证")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult add(@RequestBody @Validated @ApiParam(value = "学生认证数据") UserAuthAddDTO authDTO){
        userAuthService.studentAuth(authDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/addByAdmin"})
    @ApiOperation(value = ("学生认证"))
    @SysLogs("学生身份认证")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult addByAdmin(@RequestBody @Validated @ApiParam(value = "学生认证数据") UserAuthAddByAdminDTO authDTO){
        userAuthService.addByAdmin(authDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/review"})
    @ApiOperation(value = ("人工审核认证"))
    @SysLogs("人工审核认证")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult manualReview(UserAuthReviewDTO userAuthReviewDTO){
        userAuthService.manualReview(userAuthReviewDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/list"})
    @ApiOperation(value = ("列表"))
    @SysLogs("列表")
    public ResponseResult reviewList(@RequestBody FindUserAuthDTO dto){
        return ResponseResult.e(ResponseCode.OK,userAuthService.list(dto));
    }

    @PostMapping(value = {"/list/already"})
    @ApiOperation(value = ("人工审核列表"))
    @SysLogs("人工审核列表")
    public ResponseResult alreadyList(){
        return ResponseResult.e(ResponseCode.OK,userAuthService.alreadyList());
    }

    @PostMapping(value = {"/list/already/exadmin"})
    @ApiOperation(value = ("人工审核列表"))
    @SysLogs("人工审核列表")
    public ResponseResult alreadyListExAdmin(){
        return ResponseResult.e(ResponseCode.OK,userAuthService.alreadyListExAdmin());
    }

    @PostMapping(value = {"/list/already/exmember"})
    @ApiOperation(value = ("列表"))
    @SysLogs("列表")
    public ResponseResult alreadyListExMember(){
        return ResponseResult.e(ResponseCode.OK,userAuthService.alreadyListExMember());
    }


    @PostMapping(value = {"/remove/{id}"})
    @ApiOperation(value = ("删除记录"))
    public ResponseResult remove(@PathVariable("id") String id){
        userAuthService.remove(id);
        return ResponseResult.e(ResponseCode.OK);
    }
}
