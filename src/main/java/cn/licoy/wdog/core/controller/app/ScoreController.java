package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.service.app.ScoreSettingService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
//@RequestMapping("/get'")
@RequestMapping(value = {"/app/score"})
@Api(tags = {"学分管理"})
public class ScoreController {

    @Autowired
    private ScoreSettingService scoreService;

    @PostMapping(value = {"/get/actiId/{actiId}"})
    @ApiOperation(value = "获取活动学分设置数据")
    @SysLogs("获取部门成员列表")
    public ResponseResult getByActiId(@PathVariable(value = "actiId") @ApiParam(value = "活动ID") String actiId){
        return ResponseResult.e(ResponseCode.OK,scoreService.getByActiId(actiId));
    }
}