package cn.licoy.wdog.core.dto.system.user;

import lombok.Data;
import org.hibernate.validator.constraints.NotBlank;

@Data
public class UserAuthReviewDTO {

    @NotBlank(message = "用户信息发生异常")
    private String id;

    @NotBlank(message = "用户信息发生异常")
    private Integer status;
}