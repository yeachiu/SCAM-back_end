package cn.licoy.wdog.core.dto.system.dictionary;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.NotNull;

@Data
public class DictionaryDTO {


    private String parentId;	//

    @NotBlank(message = "字典代码不能为空")
    private String dictCode;	//

    @NotBlank(message = "字典名称不能为空")
    private String dictName;	//

    private String dictValue;	//

    @NotNull(message = "资源排序不能为空")
    private Integer sort;	//

    private String remark;	//
}
