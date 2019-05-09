package cn.licoy.wdog.core.vo.app;

import lombok.Data;

@Data
public class ActivityMemberVO {

    private String id;

    private String actiId;	//

    private String uid;	//

    private String signupData;  //用户报名提交的表单数据，为"报名"预留，返回时为空字段
}