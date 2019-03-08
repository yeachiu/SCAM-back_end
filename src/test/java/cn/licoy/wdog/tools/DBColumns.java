package cn.licoy.wdog.tools;

public class DBColumns {
    private String field; // 字段名
    private String type; // 字段类型
    private String comment;//字段说明

    public DBColumns() {
        super();
        // TODO Auto-generated constructor stub
    }

    public DBColumns(String field, String type,String comment) {
        super();
        this.field = UnderlineToHump(field);
        this.type = parseType(type);
        this.comment =  comment;
    }

    /**
     * 将数据库类型转为JAVA类型
     *
     * @param type
     * @return
     */
    public String parseType(String type) {
        String typeStr = "";
        int index = type.indexOf("(");
        if (index > -1) {
            typeStr = type.substring(0, index);
        } else {
            typeStr = type;
        }
        if (typeStr.equalsIgnoreCase("char")
                || typeStr.equalsIgnoreCase("varchar")
                || typeStr.equalsIgnoreCase("text")
                || typeStr.equalsIgnoreCase("longtext")){
            return "String";
        } else if (typeStr.equalsIgnoreCase("smallint")
                || typeStr.equalsIgnoreCase("int")
                || typeStr.equalsIgnoreCase("bigint")) {
            return "Integer";
        } else if (typeStr.equalsIgnoreCase("tinyint")) {
            return "Boolean";
        }else if (typeStr.equalsIgnoreCase("date")
                || typeStr.equalsIgnoreCase("datetime")) {
            return "Date";
        } else if (typeStr.equalsIgnoreCase("float")) {
            return "Float";
        } else {
            return "Object";
        }
    }

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

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

}
