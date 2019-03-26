package cn.licoy.wdog.core.controller.system;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.core.dto.system.dictionary.DictionaryDTO;
import cn.licoy.wdog.core.service.system.SysDictionaryService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;



@RestController
@RequestMapping(value = "/system/dictionary")
@Api(tags = {"字典管理"})
public class DictionaryController {

    @Autowired
    private SysDictionaryService dictionaryService;

    @PostMapping(value = {"/list"})
    @ApiOperation(value = "获取所有的字典列表")
    @SysLogs("获取所有的字典列表")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult list(){
        return ResponseResult.e(ResponseCode.OK,dictionaryService.list());
    }
//    app/dictionary/listByCode/{dictCode}

    @PostMapping(value = {"/list/{dictCode}"})
    @ApiOperation(value = "获取所有的字典列表")
    @SysLogs("获取所有的字典列表")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult listByCode(@PathVariable("dictCode") @ApiParam("字典代码") String dictCode){
        return ResponseResult.e(ResponseCode.OK,dictionaryService.listByCode(dictCode));
    }

    @PostMapping(value = {"/add"})
    @ApiOperation(value = "添加字典")
    @SysLogs("添加字典")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult add(@RequestBody @Validated @ApiParam("字典数据") DictionaryDTO dto){
        dictionaryService.add(dto);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/update/{id}"})
    @ApiOperation(value = "添加字典")
    @SysLogs("添加字典")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult update(@PathVariable("id") @ApiParam("字典ID") String id,
                                 @RequestBody @Validated @ApiParam("字典数据") DictionaryDTO dto){
        dictionaryService.update(id,dto);
        return ResponseResult.e(ResponseCode.OK);
    }

    @PostMapping(value = {"/remove/{id}"})
    @ApiOperation(value = "删除字典")
    @SysLogs("删除字典")
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult remove(@PathVariable("id") @ApiParam("字典ID") String id){
        dictionaryService.remove(id);
        return ResponseResult.e(ResponseCode.OK);
    }


}
