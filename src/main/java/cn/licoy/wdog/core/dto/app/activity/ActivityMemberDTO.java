package cn.licoy.wdog.core.dto.app.activity;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class ActivityMemberDTO {

    private String id;

    @NotBlank(message = "活动ID不能为空")
    private String actiId;	//

    @NotBlank(message = "用户ID不能为空")
    private String uid;	//

    private String signupData;  //用户报名提交的表单数据，为"报名"预留，返回时为空字段
}