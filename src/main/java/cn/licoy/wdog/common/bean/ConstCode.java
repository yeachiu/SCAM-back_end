package cn.licoy.wdog.common.bean;

public class ConstCode {

    private ConstCode(){}
    /**用户认证**/
    public static final Integer USER_AUTH_UNAUTH = 0;   //未认证
    public static final Integer USER_AUTH_INAUTH = 1;   //认证中
    public static final Integer USER_AUTH_ALREADY = 2;  //已认证
    public static final Integer USER_AUTH_FAIL = 3; //认证不通过
    public static final Integer USER_AUTH_DELETE = -1;  //撤回、删除


    /** 活动状态 **/
    public static final Integer ACT_STATUS_DRAFT = 0;   //草稿
    public static final Integer ACT_STATUS_PUBLISH = 1 ;   //已发布
    public static final Integer ACT_STATUS_PROCESS = 2 ;   //进行中
    public static final Integer ACT_STATUS_COMPLETE = 3;   //已结束
    public static final Integer ACT_STATUS_CANCEL = -1 ;   //已取消

}
