package cn.licoy.wdog.tools;

import cn.licoy.wdog.tools.DBColumns;
import cn.licoy.wdog.tools.db.DBHelper;
import org.springframework.util.StringUtils;

import java.io.File;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ModelGenerator {

    /**
     * 每次生成需修改
     */
    // 表名
//    static String[] tNames = {"group","group_user","activity_memberlist","activity_notice",
//            "apartment","blacklist","score_allocation","score_setting"};
//    public static String tableName = tNames[7];
    public static String tableName = "activity_admins";
    // 类名
//    static String[] mNames = {"Group","GroupUser","ActivityMemberlist","ActivityNotice",
//            "Apartment","Blacklist","ScoreAllocation","ScoreSetting"};
//    public static String modelName = mNames[7];
    public static String modelName = "ActivityAdmins";

/**********************************************************************************/

    // 包名
    public static String packagePath = "cn.licoy.wdog.core";
    // 注意：这里是文件的物理位置，根据自己的项目路径进行修改
    public static String rootPath = "F:\\AboutCode\\PROJECTS\\STUDY_DEMO\\watchdog\\watchdog-framework-master\\src\\main\\java\\";
    // 注意：还需去DBHelper修改数据库连接内容
    // 以下不用修改
    public static String mapperName = modelName + "Mapper";
    public static String serviceName = modelName + "Service";
    public static String serviceImplName = modelName + "ServiceImpl";

    public static String mapperPackagePath = packagePath
            + ".mapper.app";
    public static String modelPackagePath = packagePath
            + ".entity.app";
    public static String servicePackagePath = packagePath
            + ".service.app";
    public static String serviceImplPackagePath = packagePath
            + ".service.app.impl";

    /**====================================================================================
     * ===================================================================================*/

    public static void main(String[] args) {
		File dstDiretory = new File(rootPath+StringUtils.replace(packagePath, ".", "\\"));
		dstDiretory.getParentFile().mkdirs();
		if (!dstDiretory.exists()) {// 指定目录不存在时，创建该文件夹
			dstDiretory.mkdirs();
		}else{
		    dstDiretory.delete();
        }
        List<DBColumns> columns = getColumns(tableName);
        model(columns);
        mapper();
        service();
        serviceImpl();
    }

    /**====================================================================================
     * ===================================================================================*/
    /**
     * 抽取数据库字段
     *
     * @param tableName
     * @return
     */
    public static List<DBColumns> getColumns(String tableName) {
        List<DBColumns> columns = new ArrayList<DBColumns>();
        try {
            String sql = "select * from information_schema.columns where  table_name ='"
                    + tableName+"'";
            ResultSet rs = DBHelper.executeQuery(sql);
            while (rs.next()) {
                DBColumns column = new DBColumns(rs.getString("COLUMN_NAME"),
                        rs.getString("COLUMN_TYPE"),
                        rs.getString("COLUMN_COMMENT"));
                columns.add(column);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return columns;
    }

    /**
     * 生成model
     * import com.baomidou.mybatisplus.annotations.TableId;
     * import lombok.AllArgsConstructor;
     * import lombok.Builder;
     * import lombok.Data;
     * import lombok.NoArgsConstructor;
     * import java.io.Serializable;
     * import java.util.Date;
     * import java.util.List;
     * import cn.licoy.wdog.core.entity.Schema
     * ---------------
     * @Data
     * @NoArgsConstructor
     * @AllArgsConstructor
     * @Builder
     * ---------------
     * public class XXXXX implements Serializable  {}
     * @param columns
     */
    public static void model(List<DBColumns> columns) {
        StringBuffer sb = new StringBuffer();
        sb.append("package " + modelPackagePath + ";\r\n\r\n");
        sb.append("\r\n");
        sb.append("import cn.licoy.wdog.core.entity.Schema;\r\n");
        sb.append("import lombok.AllArgsConstructor;\r\n");
//        sb.append("import lombok.Builder;\r\n");
        sb.append("import lombok.Data;\r\n");
        sb.append("import lombok.NoArgsConstructor;\r\n");
        sb.append("import java.io.Serializable;\r\n");
        sb.append("import java.util.Date;\r\n");
        sb.append("import java.util.List;\r\n");
        sb.append("\r\n");
        sb.append("@Data\r\n");
        sb.append("@NoArgsConstructor\r\n");
        sb.append("@AllArgsConstructor\r\n");
//        sb.append("@Builder\r\n");
        sb.append("public class " + modelName
                + " extends Schema implements Serializable {\r\n");
//        sb.append("public class " + modelName
//                + " implements Serializable {\r\n");//不用添加创建时间这些
        sb.append("\t\r\n");
        for (int i = 0, len = columns.size(); i < len; i++) {
            DBColumns column = columns.get(i);
            if (column.getField().equalsIgnoreCase("id")
                    || column.getField().equalsIgnoreCase("createUser")
                    || column.getField().equalsIgnoreCase("createTime")
                    || column.getField().equalsIgnoreCase("modifyTime")
                    || column.getField().equalsIgnoreCase("modifyUser")) {
                continue;
            }
            sb.append("\tprivate " + column.getType() + " " + column.getField()
                    + ";\t//" + column.getComment() + "\r\n");
            sb.append("\t\r\n");
        }
        sb.append("\tprivate static final long serialVersionUID = 1L;\r\n");
        sb.append("\r\n");
        sb.append("}");
        try {
            TxtFileUtils.writeTxtFile(sb.toString(),
                    getRealPath(modelPackagePath, modelName + ".java"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * 生成mapper
     *
     * import cn.licoy.wdog.core.entity.system.SysUser;
     * import com.baomidou.mybatisplus.mapper.BaseMapper;
     * import org.apache.ibatis.annotations.Mapper;
     * import org.springframework.stereotype.Repository;
     *
     * @Mapper
     * @Repository
     * public interface SysUserMapper extends BaseMapper<SysUser> {
     *
     * }
     */
    public static void mapper() {
        StringBuffer sb = new StringBuffer();
        sb.append("package " + mapperPackagePath + ";\r\n");
        sb.append("\r\n");
        sb.append("import " + modelPackagePath + "." + modelName + ";\r\n");
        sb.append("import com.baomidou.mybatisplus.mapper.BaseMapper;\r\n");
        sb.append("import org.apache.ibatis.annotations.Mapper;\r\n");
        sb.append("import org.springframework.stereotype.Repository;\r\n");
        sb.append("\r\n");
        sb.append("@Mapper\r\n");
        sb.append("@Repository\r\n");
        sb.append("public interface " + mapperName + " extends BaseMapper<" + modelName + ">  {\r\n");
        sb.append("\t\r\n");
        sb.append("}\r\n");
        try {
            TxtFileUtils.writeTxtFile(sb.toString(),
                    getRealPath(mapperPackagePath, mapperName + ".java"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    /**
     * 生成service
     *
     * import cn.licoy.wdog.core.entity.system.SysUserRole;
     * import com.baomidou.mybatisplus.service.IService;
     *
     * public interface SysUserRoleService extends IService<SysUserRole> {}
     */
    public static void service() {
        StringBuffer sb = new StringBuffer();
        sb.append("package " + servicePackagePath + ";\r\n");
        sb.append("\r\n");
        sb.append("import " + modelPackagePath + "." + modelName + ";\r\n");
        sb.append("import com.baomidou.mybatisplus.service.IService;\r\n");
        sb.append("\r\n");
        sb.append("public interface " + serviceName + " extends IService<"
                + modelName+ "> {\r\n");
        sb.append("\t\r\n");
        sb.append("}\r\n");
        try {
            TxtFileUtils.writeTxtFile(sb.toString(),
                    getRealPath(servicePackagePath, serviceName + ".java"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    /**
     * 生成serviceImpl
     *
     * import cn.licoy.wdog.core.entity.system.SysUserRole;
     * import cn.licoy.wdog.core.mapper.system.SysUserRoleMapper;
     * import cn.licoy.wdog.core.service.system.SysUserRoleService;
     * import com.baomidou.mybatisplus.service.impl.ServiceImpl;
     * import org.springframework.stereotype.Service;
     * import org.springframework.transaction.annotation.Transactional;
     *
     * @Service
     * @Transactional
     * public class SysUserRoleServiceImpl extends ServiceImpl<SysUserRoleMapper,SysUserRole> implements SysUserRoleService {}
     */
    public static void serviceImpl() {
        StringBuffer sb = new StringBuffer();
        sb.append("package " + serviceImplPackagePath + ";\r\n");
        sb.append("\r\n");
        sb.append("import " + modelPackagePath + "." + modelName + ";\r\n");
        sb.append("import " + mapperPackagePath + "." + mapperName + ";\r\n");
        sb.append("import " + servicePackagePath + "." + serviceName + ";\r\n");
        sb.append("import com.baomidou.mybatisplus.service.impl.ServiceImpl;\r\n");
        sb.append("import org.springframework.stereotype.Service;\r\n");
        sb.append("import org.springframework.transaction.annotation.Transactional;\r\n");
        sb.append("\r\n");
        sb.append("@Service\r\n");
        sb.append("@Transactional\r\n");
        sb.append("public class " + serviceImplName + " extends ServiceImpl<"
                + mapperName + "," + modelName + "> implements "+ serviceName + "{\r\n");
        sb.append("\t\r\n");
        sb.append("}\r\n");
        try {
            TxtFileUtils.writeTxtFile(sb.toString(),
                    getRealPath(serviceImplPackagePath, serviceImplName + ".java"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }


    // 首字母转小写
    public static String toLowerCaseFirstOne(String s) {
        if (Character.isLowerCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder())
                    .append(Character.toLowerCase(s.charAt(0)))
                    .append(s.substring(1)).toString();
    }

    // 首字母转大写
    public static String toUpperCaseFirstOne(String s) {
        if (Character.isUpperCase(s.charAt(0)))
            return s;
        else
            return (new StringBuilder())
                    .append(Character.toUpperCase(s.charAt(0)))
                    .append(s.substring(1)).toString();
    }

    /*
     * 获取真实路径
     */
    public static String getRealPath(String pkg, String fileName) {
        return rootPath + StringUtils.replace(pkg, ".", "\\") + "\\" + fileName;
    }
}
