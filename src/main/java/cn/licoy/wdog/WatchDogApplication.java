package cn.licoy.wdog;

import cn.licoy.wdog.common.util.PortUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;


@SpringBootApplication
@EnableConfigurationProperties
@EnableTransactionManagement
@EnableCaching
public class WatchDogApplication {

    static{
        PortUtil.checkPort(6379,"Redis Application",true);
    }

    public static void main(String[] args) {
        SpringApplication.run(WatchDogApplication.class, args);
    }
}
