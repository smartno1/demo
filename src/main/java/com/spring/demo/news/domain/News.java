package com.spring.demo.news.domain;

import lombok.*;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class News {
    String titleUrl;
    String titleText;
    String contentUrl;
    String contentText;
    String videoUrl;
    String videoImg;
    String newsCompanyImg;
    String newsCompanyUrl;
    String newsCompanyName;
    String newsTime;
}
