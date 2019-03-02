package cn.licoy.wdog.common.util;

public class ConvertUtil {
    /***
     * 下划线命名转为驼峰命名
     *
     * @param str
     */
    public static String UnderlineToHump(String str){
        StringBuilder result=new StringBuilder();
        String a[]=str.split("_");
        for(String s:a){
            if (!str.contains("_")) {
                result.append(s);
                continue;
            }
            if(result.length()==0){
                result.append(s.toLowerCase());
            }else{
                result.append(s.substring(0, 1).toUpperCase());
                result.append(s.substring(1).toLowerCase());
            }
        }
        return result.toString();
    }



    /***
     * 驼峰命名转为下划线命名
     *
     * @param str
     *        驼峰命名的字符串
     */
    public static String HumpToUnderline(String str){
        StringBuilder sb=new StringBuilder(str);
        int temp=0;//定位
        if (!str.contains("_")) {
            for(int i=0;i<str.length();i++){
                if(Character.isUpperCase(str.charAt(i))){
                    sb.insert(i+temp, "_");
                    temp+=1;
                }
            }
        }
        return sb.toString().toUpperCase();
    }
}
