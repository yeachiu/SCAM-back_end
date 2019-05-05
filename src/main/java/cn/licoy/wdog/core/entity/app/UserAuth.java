package cn.licoy.wdog.core.entity.app;


import cn.licoy.wdog.core.entity.Schema;
import com.baomidou.mybatisplus.annotations.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserAuth implements Serializable {


    @TableId
    private String id;

    private String uid;	//
	
	private String stuId;	//
	
	private String realName;	//
	
	private String stuNum;	//
	
	private String dictId;	//
	
	private Integer period;	//
	
	private Integer whatClass;	//
	
	private Integer status;	//认证状态(0 = 认证中; 1 = 已认证; 2 = 不通过; -1 = 已删除)

	private String groupId;

    private Date createTime;

    private String createUser;

    private Date modifyTime;

    private String modifyUser;

	private static final long serialVersionUID = 1L;

}