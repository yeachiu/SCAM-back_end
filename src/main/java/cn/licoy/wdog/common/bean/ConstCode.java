package cn.licoy.wdog.common.bean;

public class ConstCode {

    private ConstCode(){}

    public static final int USER_AUTH_INAUTH = 1;   //认证中
    public static final int USER_AUTH_ALREADY = 2;  //已认证
    public static final int USER_AUTH_FAIL = 3; //认证不通过
    public static final int USER_AUTH_DELETE = -1;  //撤回、删除
    public static final int USER_AUTH_UNAUTH = 0;   //未认证
}
