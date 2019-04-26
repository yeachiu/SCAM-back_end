package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.activity.ActivityFormUpdateDTO;
import cn.licoy.wdog.core.service.app.ActivityFormService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = {"/app/activity/form"})
@Api(tags = {"活动学分设置和学分分配相关"})
public class ActivityFormController {

    @Autowired
    private ActivityFormService formService;

    @PostMapping(value = {"/get/{id}"})
    @ApiOperation(value = "获取某个活动的学分设置数据")
    @SysLogs("获取某个活动的学分设置数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult get(@PathVariable(value = "id") @ApiParam(value = "活动ID标识") String actiId){
        return (ResponseResult.e(ResponseCode.OK,formService.getByActiId(actiId)));
    }

    @PostMapping(value = {"/update"})
    @ApiOperation(value = "更新某个活动的学分设置数据")
    @SysLogs("更新某个活动的学分设置数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult update(@RequestBody @ApiParam(value = "更新的数据") ActivityFormUpdateDTO data){
        this.formService.updateByActiId(data.getActiId(),data.getRules());
        return (ResponseResult.e(ResponseCode.OK));
    }
}
