package cn.licoy.wdog.core.vo.app;

import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ApartmentMemberVO {

    private StudentVO member;

    private List<ActivityAbstractVO> activities;

    private Date createTime;
}
