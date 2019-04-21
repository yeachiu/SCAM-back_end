package cn.licoy.wdog.core.dto.system.user;

import lombok.Data;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class UserAuthAddDTO {

    @NotBlank(message = "用户信息发生异常")
    private String uid;

    @NotBlank(message = "学生姓名不能为空")
    private String realName;

    @NotBlank(message = "学号不能为空")
    @Length(min = 13,max = 13,message = "学号长度应为{min}到 {max}")
    private String stuNum;

    @NotBlank(message = "年级不能为空")
    private Integer period;

    @NotBlank(message = "班级不能为空")
    private Integer whatClass;

    @NotBlank(message = "专业不能为空")
    private String dictId;
}
