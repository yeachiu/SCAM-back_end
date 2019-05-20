package cn.licoy.wdog.core.controller.app;

import cn.licoy.wdog.common.annotation.SysLogs;
import cn.licoy.wdog.common.bean.ResponseCode;
import cn.licoy.wdog.common.bean.ResponseResult;
import cn.licoy.wdog.common.controller.CrudController;
import cn.licoy.wdog.core.service.app.StudentService;
import cn.licoy.wdog.core.dto.app.student.FindStudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentDTO;
import cn.licoy.wdog.core.dto.app.student.StudentUpdateDTO;
import cn.licoy.wdog.core.vo.app.StudentVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = {"/app/student"})
@Api(tags = {"学生信息管理"})
public class StudentController implements CrudController<StudentVO,StudentDTO,StudentUpdateDTO,String,FindStudentDTO,StudentService> {

    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }

    @Override
    public StudentService getService() {
        return studentService;
    }

    @PostMapping(value = {"/alllist"})
    @ApiOperation(value = "获取学生列表")
    @SysLogs("获取学生列表")
    public ResponseResult allList(){
        return ResponseResult.e(ResponseCode.OK,studentService.allList());
    }

    @PostMapping(value = {"/listExAdmin"})
    @ApiOperation(value = "获取学生列表")
    @SysLogs("获取学生列表")
    public ResponseResult listExAdmin(){
        return  ResponseResult.e(ResponseCode.OK,studentService.studentListExAdmin());
    }

    @PostMapping(value = {"/list/unauth"})
    @ApiOperation(value = "获取学生列表")
    @SysLogs("获取学生列表")
    public ResponseResult unauthList(){
        return  ResponseResult.e(ResponseCode.OK,studentService.unauthList());
    }
}
