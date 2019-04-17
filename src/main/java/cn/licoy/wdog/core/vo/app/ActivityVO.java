package cn.licoy.wdog.core.vo.app;

import lombok.Data;

import java.util.Date;

@Data
public class ActivityVO {

    private String id;

    private String title;	//活动标题

    private String description;	//活动内容介绍及描述

    private String pictureurl;	//配图文件路径

    private Date signupTime;	//报名起始时间

    private Date deadlineTime;	//报名截止时间

    private Date startTime;	//活动开始时间

    private Date endTime;	//

    private String url;	//

    private Integer status;	//状态

    private String organizerId;	//主办方

    private String groupId;	//分组限制

    private Integer limitQuota;	//活动名额 默认不限

    private Integer isblackList;	//是否黑名单限制(0=true;1=false)

    private Integer isreview;	//是否人工审核(0=true;1=false)

    private String associationId;

    private Date createTime;
}
