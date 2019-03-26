package cn.licoy.wdog.core.controller;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 * Created by qWX649512 on 2019/3/26.
 */
@RestController
public class UploadHandler {

    /**
     * 单个文件上传
     */
    @RequestMapping(value = "/upload")
    @ResponseBody
    @ApiImplicitParam(paramType = "header",name = "Authorization",value = "身份认证Token")
    public ResponseResult upload(@RequestParam("file") MultipartFile file){
        String dir = System.getProperty("user.dir");
        System.out.println("项目当前路径："+dir);
        //构建路径
        File afile=new File(dir+File.separatorChar+"ImageData");
        if(!afile.exists()){
            afile.mkdir();
        }
        String resourceLocation=afile.getAbsolutePath()+ File.separatorChar;
        System.out.println(resourceLocation+">>>>>>");
        //获取文件后缀
        String name = file.getOriginalFilename();
        String suffix = name.substring(name.lastIndexOf("."));
        // 上传文件名,使用时间戳命名
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String filename = "img_" + sdf.format(new Date(System.currentTimeMillis())) + suffix;
        try {
            // 服务器端保存的文件对象
            File serverFile = new File(resourceLocation + filename);
            // 将上传的文件写入到服务器端文件内
            file.transferTo(serverFile);
        }catch (Exception e){
            // 打印错误堆栈信息
            e.printStackTrace();
            return ResponseResult.e(ResponseCode.FAIL);
        }
        return ResponseResult.e(ResponseCode.OK,filename);
    }

}
