package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.activity.ActivityMemberDTO;
import cn.licoy.wdog.core.dto.app.activity.CheckinDTO;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import cn.licoy.wdog.core.service.app.ActivityMemberService;
import cn.licoy.wdog.core.service.app.SignupFormService;
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
    @Autowired
    private SignupFormService signupFormService;

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

    @PostMapping(value = {"/get/list/{actiId}"})
    @ApiOperation(value = "分页获取活动数据")
    @SysLogs("分页获取活动数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult changeState(@PathVariable(value = "actiId") String actiId){

        return ResponseResult.e(ResponseCode.OK,signupFormService.list(actiId));
    }

    @PostMapping(value = {"/checkin"})
    @ApiOperation(value = "分页获取活动数据")
    @SysLogs("分页获取活动数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult changeState(@RequestBody @Validated @ApiParam(value = "报名表单信息") CheckinDTO dto){
        signupFormService.updateById(dto.getActiId(),dto.getSignupData());
        return ResponseResult.e(ResponseCode.OK);
    }
}