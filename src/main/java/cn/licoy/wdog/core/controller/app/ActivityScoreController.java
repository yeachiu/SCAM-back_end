package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.service.app.ScoreSettingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = {"/app/activity/score"})
@Api(tags = {"活动学分设置和学分分配相关"})
public class ActivityScoreController {

    @Autowired
    private ScoreSettingService scoreService;

    @PostMapping(value = {"/get/{id}"})
    @ApiOperation(value = "获取某个活动的学分设置数据")
    @SysLogs("获取某个活动的学分设置数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult get(@PathVariable @ApiParam(value = "活动ID标识") String actiId){
        return (ResponseResult.e(ResponseCode.OK,scoreService.getByActiId(actiId)));
    }

    @PostMapping(value = {"/update/{id}"})
    @ApiOperation(value = "更新某个活动的学分设置数据")
    @SysLogs("更新某个活动的学分设置数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult update(@PathVariable @ApiParam(value = "活动ID标识") String actiId,
                                 @RequestBody @ApiParam(value = "更新的数据") String jsonStr){
        this.scoreService.updateByActiId(actiId,jsonStr);
        return (ResponseResult.e(ResponseCode.OK));
    }
}
