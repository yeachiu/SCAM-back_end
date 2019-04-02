//package cn.licoy.wdog.core.config;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.boot.SpringBootConfiguration;
//import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
//import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
//@SpringBootConfiguration
//public class FileHandleConfig extends WebMvcConfigurerAdapter {
//
//    @Value("${web.upload.path}")
//    private String uploadPath;
//
//    @Override
//    public void addResourceHandlers(ResourceHandlerRegistry registry) {
//        super.addResourceHandlers(registry);
//        registry.addResourceHandler("/uploads/**").addResourceLocations(
//                "file:"+uploadPath);
//
//    }
//
//}
//
