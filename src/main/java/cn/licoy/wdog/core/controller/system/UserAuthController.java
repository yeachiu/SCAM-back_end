package cn.licoy.wdog.core.controller.system;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.system.user.UserAuthAddDTO;
import cn.licoy.wdog.core.dto.system.user.UserAuthReviewDTO;
import cn.licoy.wdog.core.service.system.SysUserAuthService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


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
    public ResponseResult userAuthForStudent(@RequestBody @Validated @ApiParam(value = "学生认证数据") UserAuthAddDTO authDTO){
        userAuthService.studentAuth(authDTO);
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
    @ApiOperation(value = ("人工审核列表"))
    @SysLogs("人工审核列表")
    public ResponseResult reviewList(){
        return ResponseResult.e(ResponseCode.OK,userAuthService.list());
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
}
