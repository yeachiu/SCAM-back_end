package cn.licoy.wdog.core.dto.app.apartment;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;



@Data
public class ApartmentDTO {

    @NotBlank(message = "部门名称不能为空")
    private String name;	//

    @NotBlank(message = "请为部门选择一个管理员")
    private String apartAdmin;	//

    private Object about;	//
}
