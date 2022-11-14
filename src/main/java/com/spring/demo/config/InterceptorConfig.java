package com.spring.demo.config;

import com.spring.demo.interceptor.*;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@RequiredArgsConstructor
public class InterceptorConfig implements WebMvcConfigurer {


    private final BeforeLikeInterceptor beforeLikeInterceptor;

    private final AutoLoginInterceptor autoLoginInterceptor;

    private final AfterLoginInterceptor afterLoginInterceptor;

    private final BoardInterceptor boardInterceptor;

    private final ReplyInterceptor replyInterceptor;

    private final GalleryInterceptor galleryInterceptor;

    private final MyPageInterceptor myPageInterceptor;

    private final ShopInterceptor shopInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {




        // 애프터 로그인 인터셉터 설정
        registry.addInterceptor(afterLoginInterceptor)
                .addPathPatterns("/member/sign-in", "/member/sign-up");


        // 자동 로그인 인터셉터 설정
        registry.addInterceptor(autoLoginInterceptor)
                .addPathPatterns("/**");


        // 비포 라이크 인터셉터 설정
        registry.addInterceptor(beforeLikeInterceptor)
                .addPathPatterns("/like/*");

        registry.addInterceptor(myPageInterceptor)
                .addPathPatterns("/myPage/*","/member/myPage");


        // 게시판 인터셉터 설정
        registry.addInterceptor(boardInterceptor)
                .addPathPatterns("/board/*")
                .excludePathPatterns("/board/list", "/board/content");

        // 댓글 인터셉터 설정
        registry.addInterceptor(replyInterceptor)
                .addPathPatterns("/api/v1/replies*");

        // 갤러리 인터셉터 설정
        registry.addInterceptor(galleryInterceptor)
                .addPathPatterns("/gallery/*");
//                .excludePathPatterns("/gallery/list");

        registry.addInterceptor(shopInterceptor)
                .addPathPatterns("/shop/*")
                .excludePathPatterns("/shop/list", "/shop/detail");


    }

}
