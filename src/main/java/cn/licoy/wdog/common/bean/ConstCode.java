package cn.licoy.wdog.common.bean;

public class ConstCode {

    private ConstCode(){}
    /**用户认证**/
    public static final Integer USER_AUTH_UNAUTH = 0;   //未认证
    public static final Integer USER_AUTH_INAUTH = 1;   //认证中
    public static final Integer USER_AUTH_ALREADY = 2;  //已认证
    public static final Integer USER_AUTH_FAIL = 3; //认证不通过
//    public static final Integer USER_AUTH_DELETE = -1;  //撤回、删除


    /** 活动状态 **/
    public static final Integer ACT_STATUS_DRAFT = 1;   //草稿
    public static final Integer ACT_STATUS_PUBLISH = 2 ;   //已发布
    public static final Integer ACT_STATUS_PROCESS = 3 ;   //进行中
    public static final Integer ACT_STATUS_COMPLETE = 4;   //已结束
    public static final Integer ACT_STATUS_CANCEL = 0 ;   //已取消

    /** 分组标识 **/
    public static final Integer SYMBOL_USER = 0;    //用户分组
    public static final Integer SYMBOL_APARTMENT = 1;   //  部门分组
    public static final String PERIOD_NAME = "级";
    public static final String CLASS_NAME = "班";

    /** Boolean类型 **/
    public static final Integer TRUE = 0;
    public static final Integer FALSE = 1;
}
