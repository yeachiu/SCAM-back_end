package cn.licoy.wdog.core.vo.app;

import lombok.Data;

import java.util.Date;

@Data
public class ActivityAbstractVO {

    private String id;

    private String title;	//活动标题

    private String description;	//活动内容介绍及描述

    private String pictureurl;	//配图文件路径

    private Date signupTime;	//报名起始时间

    private Date deadlineTime;	//报名截止时间

    private Date startTime;	//活动开始时间

    private Date endTime;	//

    private Integer status;	//状态

    private String organizerId;	//主办方

}
