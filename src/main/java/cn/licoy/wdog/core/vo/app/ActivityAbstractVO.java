package cn.licoy.wdog.core.vo.app;

import lombok.Data;

import java.util.Date;

/**
 * 本数据对象面向客户端用户，禁止出现系统内部字段
 */
@Data
public class ActivityAbstractVO {

    private String id;              //活动ID

    private String title;	        //活动标题

    private String address;         //活动地址

    private String description;	    //活动内容介绍及描述

    private String pictureUrl;	    //配图文件路径

    private Date signupTime;	    //报名起始时间

    private Date deadlineTime;	    //报名截止时间

    private Date startTime;	        //活动开始时间

    private Date endTime;	        //活动结束时间

    private Integer status;	        //活动状态

    private String organizerId;	    //主办方ID

    private String organizerName;   //主办方名称
}
