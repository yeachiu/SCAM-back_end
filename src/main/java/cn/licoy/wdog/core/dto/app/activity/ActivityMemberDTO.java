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

}