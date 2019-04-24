package cn.licoy.wdog.core.dto.app.activity;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class ActivityUpdateDTO {

    @NotBlank(message = "活动标题不能为空")
    private String title;	//活动标题

    @NotBlank(message = "活动标题不能为空")
    private String description;	//活动内容介绍及描述

    @NotBlank(message = "活动标题不能为空")
    private String address; //  地点

    private String pictureUrl;	//配图文件路径

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date signupTime;	//报名起始时间

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deadlineTime;	//报名截止时间

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;	//活动开始时间

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;	//

    private Integer limitQuota;	//活动名额，默认不限

    private Integer isreview;   //是否人工审核

//    private Integer status;  //活动状态

    private String otherAdmin;     //  其他管理员

    private String groupId;	//分组限制


}
