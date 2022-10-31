package com.spring.demo.util;



import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import com.spring.demo.member.domain.Member;
import lombok.extern.log4j.Log4j2;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Log4j2
public class FileUtils {

    // MIME TYPE 설정을 위한 맵 만들기
    private static final Map<String, MediaType> mediaMap;

    static {
        mediaMap = new HashMap<>();
        mediaMap.put("JPG", MediaType.IMAGE_JPEG);
        mediaMap.put("GIF", MediaType.IMAGE_GIF);
        mediaMap.put("PNG", MediaType.IMAGE_PNG);
    }

    public static Gallery uploadFile(MultipartFile file, String fileText, String uploadPath, HttpServletRequest req){

        System.out.println("file: " + file);
        System.out.println("text: " + fileText);
        String  newPath = "\\galleryImg";

        // 중복이 없게 파일명 변경
        String newFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
        log.info("uploadPath = {}",uploadPath);
        // 파일 업로드 수행
        File f = new File(uploadPath + newPath, newFileName);
        log.info("file f = {}",f);
        try {
            file.transferTo(f);
        }catch (IOException e){
            e.printStackTrace();
        }

        // Gallery 객체에 데이터 담기
        String fullPath = newPath + "\\" + newFileName;
        fullPath = fullPath.replace("\\", "/");
        String filename = file.getOriginalFilename();
//        Member user =(Member) req.getSession().getAttribute("user");
//        System.out.println(user);

        Gallery gallery = new Gallery();
        gallery.setText(fileText);
        gallery.setSrc(fullPath);
//        gallery.setAccount(user.getAccount());
        System.out.println(gallery);

        return gallery;
    }


}
