package cn.licoy.wdog;

import org.springframework.util.AntPathMatcher;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;

import java.io.FileNotFoundException;

public class PathTest {

    /**
     * springboot获取当前项目路径的地址
     */
    public static void main(String[] args) {
        String path = System.getProperty("user.dir");
        System.out.println("path:" + path);

        //获取classes目录绝对路径

        String path1 = ClassUtils.getDefaultClassLoader().getResource("").getPath();
        System.out.println("path1:" + path1);
        try {
            String path2 = ResourceUtils.getURL("classpath:").getPath();
            System.out.println("path2:" + path2);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }


}
