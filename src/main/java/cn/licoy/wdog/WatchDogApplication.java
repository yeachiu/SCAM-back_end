package cn.licoy.wdog;

import cn.licoy.wdog.common.util.PortUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.net.InetAddress;
import java.net.UnknownHostException;


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
        try {
            InetAddress address = null;
            address = InetAddress.getLocalHost();
            System.out.println(" App running at:    " );
            System.out.println("                     http://"+ address.getHostAddress() + ":1000\"");
        } catch (UnknownHostException e) {
            e.printStackTrace();
        }
    }
}
