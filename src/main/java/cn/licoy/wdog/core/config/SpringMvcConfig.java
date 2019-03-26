package cn.licoy.wdog.core.config;

import cn.licoy.wdog.common.resolver.JwtTokenArgumentResolver;
import org.springframework.boot.SpringBootConfiguration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import java.io.File;
import java.util.List;

/**
 * @author licoy.cn
 * @version 2018/9/13
 */
@SpringBootConfiguration
public class SpringMvcConfig extends WebMvcConfigurerAdapter {

    @Override
    public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
        argumentResolvers.add(new JwtTokenArgumentResolver());
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        String dir = System.getProperty("user.dir");

        //System.out.println("项目当前路径："+dir);
        //构建路径
        File file=new File(dir+File.separatorChar+"ImageData");
        if(!file.exists()){
            file.mkdir();
        }
        String resourceLocation=file.getAbsolutePath()+File.separatorChar;
        //System.out.println(resourceLocation+">>>>>>");

        registry.addResourceHandler("/upload/**")
                .addResourceLocations("classpath:/META-INF/resources/")
                .addResourceLocations("classpath:/resources/")
                .addResourceLocations("classpath:/static/")
                .addResourceLocations("classpath:/public/")
                .addResourceLocations("file:"+resourceLocation);
        super.addResourceHandlers(registry);
    }


}
