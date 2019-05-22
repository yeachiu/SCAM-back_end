package cn.licoy.wdog;

import lombok.extern.slf4j.Slf4j;
import cn.licoy.wdog.common.util.PortUtil;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.boot.web.servlet.MultipartConfigFactory;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.servlet.MultipartConfigElement;
import java.net.InetAddress;
import java.net.UnknownHostException;

@Slf4j
@SpringBootApplication
@EnableConfigurationProperties
@EnableTransactionManagement
@EnableCaching
public class WatchDogApplication {

//    static{
//        PortUtil.checkPort(6379,"Redis Application",true);
//    }

    public static void main(String[] args) {
        SpringApplication.run(WatchDogApplication.class, args);
        try {
            InetAddress address = null;
            address = InetAddress.getLocalHost();
            log.info("App running at:   http://" + address.getHostAddress() + ":1000");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }

    /**
     * 文件上传配置
     * @return
     */
    @Bean
    public MultipartConfigElement multipartConfigElement() {
        MultipartConfigFactory factory = new MultipartConfigFactory();
        //单个文件最大
        factory.setMaxFileSize("10240KB"); //KB,MB
        /// 设置总上传数据总大小
        factory.setMaxRequestSize("102400KB");
        return factory.createMultipartConfig();
    }
}
