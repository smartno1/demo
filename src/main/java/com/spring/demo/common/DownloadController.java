package com.spring.demo.common;

import com.spring.demo.gallery.domain.Gallery;
import com.spring.demo.gallery.service.GalleryService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

@Controller
@Log4j2
@RequiredArgsConstructor
public class DownloadController {
    private static final String UPLOAD_PATH = "D:\\java_project_09\\demo\\src\\main\\resources\\";
    private final GalleryService galleryService;

    @GetMapping("/download")
    public String download(int id, HttpServletRequest request, HttpServletResponse response){
        Gallery gallery = galleryService.findOneService(id);
        String filePath = gallery.getSrc();
        String fileName = filePath.substring(filePath.indexOf("_")+1);
        try {
            byte[] fileByte = FileUtils.readFileToByteArray(new File(UPLOAD_PATH+filePath));
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;fileName=\""
                    + URLEncoder.encode(fileName, StandardCharsets.UTF_8) + "\";");
            response.setHeader("Content-Transfer-Encoding","binary");

            response.getOutputStream().write(fileByte);
            response.getOutputStream().flush();



            return "/gallery/list";

        }catch (IOException e){
            e.printStackTrace();
        }
        return "/gallery/list";
    }
}
