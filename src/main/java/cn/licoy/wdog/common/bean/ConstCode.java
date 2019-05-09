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
    public static final Integer ACT_STATUS_COMPLETE = 4;   //已完成
    public static final Integer ACT_STATUS_DONE = 5; //已结束
    public static final Integer ACT_STATUS_CANCEL = 0 ;   //已取消

    /** 分组标识 **/
    public static final Integer SYMBOL_USER = 0;    //用户分组
    public static final Integer SYMBOL_APARTMENT = 1;   //  部门分组
    public static final String PERIOD_NAME = "级";
    public static final String CLASS_NAME = "班";

    /** Boolean类型 **/
    public static final Integer TRUE = 0;
    public static final Integer FALSE = 1;
    
    /** 静态资源访问路径 **/
    public static final String staticResourcePath = "http://localhost:1000/upload";

    /** 根目录代码 **/
    public static final String PERIOD  = "PERIOD";
    public static final String ROOT = "ROOT";

    /** 系统角色代码 **/
    public static final String APAR_ADMIN = "1111314161494679553";     // 部门管理员
    public static final String APAR_MEMBER = "1119210975065563137";    // 部门成员
    public static final String AUTH_USER = "1123124274928934913";      // 认证用户
    public static final String USER = "989416986389880834";
}
