package com.spring.demo.news.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import com.spring.demo.member.controller.MemberController;
import com.spring.demo.news.domain.News;
import lombok.extern.log4j.Log4j2;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.*;
import java.text.*;

@Log4j2
@Controller
public class NewsController {
    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    public static HashMap<String, String> map;

    @GetMapping("/news")
    public String startCrawl(Model model) throws IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd", Locale.KOREA);
        Date currentTime = new Date();

        String dTime = formatter.format(currentTime);
        String e_date = dTime;

        currentTime.setDate(currentTime.getDate() - 1);
        String s_date = formatter.format(currentTime);

        String query = "BTS";
        String s_from = s_date.replace(".", "");
        String e_to = e_date.replace(".", "");
        int page = 1;

        List<News> arr = new ArrayList<>();
        while (page < 20) {
            String address = "https://search.naver.com/search.naver?where=news&query=" + query + "&sort=1&ds=" + s_date
                    + "&de=" + e_date + "&nso=so%3Ar%2Cp%3Afrom" + s_from + "to" + e_to + "%2Ca%3A&start="
                    + Integer.toString(page);
            Document rawData = Jsoup.connect(address).timeout(5000).get();

//            log.info("address - {}",address);
//            log.info("rawDate - {}",rawData);

            Elements blogOption = rawData.select(".news_wrap");

            log.info("blogOprion - {}", blogOption);
            for (Element option : blogOption) {
                News news = new News();
                news.setTitleUrl(option.select(".news_tit").attr("href"));
                news.setTitleText(option.select(".news_tit").text());
                news.setContentUrl(option.select(".dsc_txt_wrap").attr("href"));
                news.setContentText(option.select(".dsc_txt_wrap").text());
                news.setVideoUrl(option.select(".dsc_thumb").attr("href"));
                news.setVideoImg(option.select(".thumb.api_get").attr("src"));
                news.setNewsCompanyUrl(option.select(".info.press").attr("href"));
                news.setNewsCompanyName(option.select(".info.press").text());
                news.setNewsCompanyImg(option.select(".thumb").attr("src"));
                news.setNewsTime(option.select(".info").text());
                log.info(news.getNewsTime());
//                log.info("rearUrl - {}",);
//                log.info("rearTitle - {}",realTITLE);

               arr.add(news);
            }
            page += 10;
        }
        log.info("arr - {}", arr);
        model.addAttribute("arr", arr);

        return "news/news";
    }
}