package cn.licoy.wdog.core.dto.app.group;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

@Data
public class FindClazzDTO {

    @NotBlank(message = "专业不能为空")
    private String dictId;

    @NotNull(message = "年级不能为空")
    private Integer period;
}