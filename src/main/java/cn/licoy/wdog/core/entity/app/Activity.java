package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Activity extends Schema implements Serializable {
	
	private String title;	//活动标题
	
	private String description;	//活动内容介绍及描述
	
    private String address; //  地点
	
	private String pictureUrl;	//配图文件路径
	
	private Date signupTime;	//报名起始时间
	
	private Date deadlineTime;	//报名截止时间
	
	private Date startTime;	//活动开始时间
	
	private Date endTime;	//
	
	private String url;	//
	
	private Integer status;	//状态
	
	private String organizerId;	//主办方
	
//	private String otherAdminId;	//活动管理员,用逗号连接的数组 	==> userId -> activityObjects --> 表activity_admins
	
//	private String groupId;	//分组限制,用逗号连接的数组==>用途：userId -> groupId -> activityObjects -->另外建表
	
	private Integer limitQuota;	//活动名额
	
	private Integer isblacklist;	//是否黑名单限制(0=true;1=false)
	
	private Integer isreview;	//是否人工审核(0=true;1=false)
	
	private String associationId;	//
	
	private static final long serialVersionUID = 1L;

}
