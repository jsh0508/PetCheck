package com.petcheck.controller;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/petImgUploads/**")
                .addResourceLocations("file:///C:/eGovFrame-4.0.0/workspace.edu/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/PetCheck/resources/petImgUploads/");
    }
}