package com.family.controller;

import com.alibaba.fastjson.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Controller
@RequestMapping("file")
public class FileController {

    @ResponseBody
    @RequestMapping("upload.do")
    public JSONObject addImg(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONObject json = new JSONObject();
        MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);

        // 获得文件：
        MultipartFile file= multipartRequest.getFile("file");
        Path path = null;
        if(!(file.getOriginalFilename() == null || "".equals(file.getOriginalFilename()))){
            String imgDir = "/Users/gechenguang/Documents/tool/pic";
            // 对文件进行存储处理
            byte[] bytes = file.getBytes();
            String url = UUID.randomUUID() + file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
            path = Paths.get(imgDir, url);
            Files.write(path,bytes);
        }
        json.put("path", path.toString());
        return json;
    }

}
