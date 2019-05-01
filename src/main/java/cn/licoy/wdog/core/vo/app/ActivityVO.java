package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.vo.system.SimpleUserVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ActivityVO {

    /** 基本信息 **/

    private String id;

    private String title;	//活动标题

    private String description;	//活动内容介绍及描述

    private String address; //  地点

    private String pictureUrl;	//配图文件路径

    private Date signupTime;	//报名起始时间

    private Date deadlineTime;	//报名截止时间

    private Date startTime;	//活动开始时间

    private Date endTime;	//

    private Integer status;	//状态

    private Date createTime;

    private String createUser;

    private String organizerId;

    /** 活动限制 **/

    private List<SimpleGroupVO> grouplimit;	//分组限制

    private Integer limitQuota;	//活动名额 默认不限

    private Integer isreview;	//是否人工审核(0=true;1=false)

    /**  管理员 **/

    private List<SimpleUserVO> otherAdmin;

    /** 当前报名人数 **/
    private Integer memberNow;

    /** 主办方 **/
    private SimpleApartmentVO organizer;



}
