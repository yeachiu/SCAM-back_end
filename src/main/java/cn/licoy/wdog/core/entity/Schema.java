package cn.licoy.wdog.core.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Schema implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId
    private String id;

    private Date createTime;

    private String createUser;

    private Date modifyTime;

    private String modifyUser;
}
