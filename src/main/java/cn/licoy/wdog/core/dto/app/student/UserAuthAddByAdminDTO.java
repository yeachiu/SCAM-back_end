package cn.licoy.wdog.core.dto.app.student;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class UserAuthAddByAdminDTO {

    @NotBlank(message = "请选择一个用户")
    private String uid;

    @NotBlank(message = "请选择一个学生")
    private String stuId;
}
