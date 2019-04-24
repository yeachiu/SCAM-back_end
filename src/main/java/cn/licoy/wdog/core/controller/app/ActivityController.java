package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.app.activity.ActivityAddDTO;
import cn.licoy.wdog.core.dto.app.activity.ActivityUpdateDTO;
import cn.licoy.wdog.core.service.app.ActivityService;
import cn.licoy.wdog.core.dto.app.activity.FindActivityDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping(value = {"/app/activity"})
@Api(tags = {"活动管理"})
public class ActivityController {

    @Autowired
    private ActivityService activityService;

    @PostMapping(value = {"/add"})
    @ApiOperation(value = "添加活动")
    @SysLogs("添加活动")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult add(@RequestBody @Validated @ApiParam(value = "用户数据") ActivityAddDTO addDTO){
        System.out.println("============================================= >>>> addDTO:" + addDTO.toString());
        activityService.add(addDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/update/{id}"})
    @ApiOperation(value = "更新活动")
    @SysLogs("更新活动")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult update(@PathVariable("id") @ApiParam(value = "用户标识ID") String id,
                                 @RequestBody @Validated @ApiParam(value = "用户数据") ActivityUpdateDTO updateDTO){
        activityService.update(id,updateDTO);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/list"})
    @ApiOperation(value = "分页获取活动数据")
    @SysLogs("分页获取活动数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult get(@RequestBody @Validated @ApiParam(value = "活动获取过滤条件") FindActivityDTO findActivityDTO){
        return ResponseResult.e(ResponseCode.OK,activityService.getAllActivityByAparId(findActivityDTO));
    }

    @PostMapping(value = {"/list/cancel"})
    @ApiOperation(value = "分页获取回收站数据")
    @SysLogs("分页获取回收站数据")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult getCancel(@RequestBody @Validated @ApiParam(value = "活动获取过滤条件") FindActivityDTO findActivityDTO){
        return ResponseResult.e(ResponseCode.OK,activityService.getCancelActivityBySplitPage(findActivityDTO));
    }

    @PostMapping(value = {"/statusChange/{id}/{status}"})
    @ApiOperation(value = "改变活动状态")
    @SysLogs("改变活动状态")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult statusChange(@PathVariable("id") @ApiParam(value = "活动标识ID")String id,Integer status){
        return ResponseResult.e(ResponseCode.OK);
    }
}
