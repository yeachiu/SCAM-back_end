package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.activity.ActivityMemberDTO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.service.app.ActivityMemberService;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = {"/app/activity/signup"})
public class ActivitySignupController {

    @Autowired
    private ActivityMemberService signupService;

    @PostMapping(value = {"/checkState"})
    @ApiOperation(value = "分页获取活动数据")
    @SysLogs("分页获取活动数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult checkState(@RequestBody @Validated @ApiParam(value = "报名活动信息") ActivityMemberDTO checkDTO){
        return ResponseResult.e(ResponseCode.OK,signupService.checkState(checkDTO));
    }

    @PostMapping(value = {"/changeState"})
    @ApiOperation(value = "分页获取活动数据")
    @SysLogs("分页获取活动数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult changeState(@RequestBody @Validated @ApiParam(value = "报名活动信息") ActivityMemberDTO changeDTO){
        signupService.changeState(changeDTO);
        return ResponseResult.e(ResponseCode.OK);
    }
}