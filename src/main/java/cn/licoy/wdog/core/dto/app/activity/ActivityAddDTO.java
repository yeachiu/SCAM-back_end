package cn.licoy.wdog.core.dto.app.activity;

import cn.licoy.wdog.core.entity.app.ScoreSetting;
import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.Pattern;
import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * 创建活动
 *
 * 获取主办方ID，当前用户信息，进行权限校验
 * 加载活动表单信息：
 *  input:标题，名额
 *  text: 描述
 *  datetime: 报名时段，进行时段
 *  picture:
 *  boolean:黑名单，人工审核
 *  ---
 *  groupId
 */
@Data
public class ActivityAddDTO {

    @NotBlank(message = "活动标题不能为空")
    private String title;	//活动标题

    private String description;	//活动内容介绍及描述

    private String pictureUrl;	//配图文件路径

//    @NotBlank(message = "报名起始时间不能为空")
//    @Pattern(regexp="^[0-9]{4}-[0-9]{2}-[0-9]{2}$",message="出生日期格式不正确")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date signupTime;	//报名起始时间

//    @NotBlank(message = "报名截止时间不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date deadlineTime;	//报名截止时间

//    @NotBlank(message = "活动开始时间不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;	//活动开始时间

//    @NotBlank(message = "活动结束时间不能为空")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;	//

    private Integer limitQuota;	//活动名额，默认不限

    private Integer isblacklist;	//是否黑名单限制(0=true;1=false)

    private Integer isreview;   //是否人工审核

    private Integer status;  //活动状态

    private String otherAdmin;     //  其他管理员   ==>     t_activityAdmins {id,activityId,userId}

    private String groupId;	//分组限制  ==>   t_groupLimit {id,actiId,groupId}

    private String rules;   //  表单规则 ==>   t_activityForm {id,activityId,rules,status}

    private String scoreData; //    ==>   t_scoreSetting {id,aid,awardName,awardNum,awardScore}

    /**********************************************************************/


}
