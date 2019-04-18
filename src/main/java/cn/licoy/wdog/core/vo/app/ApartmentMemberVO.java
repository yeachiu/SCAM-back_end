package cn.licoy.wdog.core.vo.app;

import cn.licoy.wdog.core.vo.StudentVO;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class ApartmentMemberVO {

    private String id;

    private StudentVO member;

    private List<ActivityAbstractVO> activities;

    private Date createTime;
}
