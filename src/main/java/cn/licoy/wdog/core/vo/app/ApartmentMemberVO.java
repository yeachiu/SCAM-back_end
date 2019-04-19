package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.vo.system.UserAuthVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ApartmentMemberVO {

    private String id;

    private UserAuthVO member;

    private List<ActivityAbstractVO> activities;

    private Date createTime;
}
