package com.spring.demo.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/galleryImg/**").addResourceLocations("file:src/main/resources/galleryImg/");
//        registry.addResourceHandler("/resources/**").addResourceLocations("file:src/main/resources/");
//        registry.addResourceHandler("/**").addResourceLocations("file:src/main/resources/");
    }
}
