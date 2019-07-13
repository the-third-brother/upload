package com.gdufe.controller;

import com.alibaba.fastjson.JSONObject;
import com.gdufe.entity.Category;
import com.gdufe.entity.SoftwareDetails;
import com.gdufe.entity.User;
import com.gdufe.service.CategoryService;
import com.gdufe.service.UploadService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/upload")
public class UploadController {

    @Autowired
    private CategoryService categoryService;

    @Autowired
    private UploadService uploadService;
    /**
     * 上传单个文件操作
     * @return
     */
    @ResponseBody
    @RequestMapping("/doUploadFile")
    public JSONObject doUploadFile(MultipartFile file, Model model){
        String fileSize = "";
        String fileName = "";
        String realUrl = "";
        if(!file.isEmpty()){
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File("/wuu/software/",
                        file.getOriginalFilename()));
                fileSize = FileUtils.byteCountToDisplaySize(file.getSize());
                fileName = file.getOriginalFilename();
                realUrl = file.getOriginalFilename();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        JSONObject jsonObject = new JSONObject();
        jsonObject.put("fileSize", fileSize);
        jsonObject.put("fileName", fileName);
        jsonObject.put("realUrl", realUrl);
        jsonObject.put("url", "/upload/goToUpload");
        return jsonObject;
    }

    @RequestMapping("/doUploadInfo")
    public RedirectView doUploadInfo(SoftwareDetails softwareDetails, Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        String url = "/"+softwareDetails.getUrl();
        softwareDetails.setUrl(url);

        Date date = new Date();
        softwareDetails.setUploadTime(date);
        User u = (User)session.getAttribute("u");
        softwareDetails.setUploader(u.getUser());
        Boolean result = false;
        result = uploadService.addSoftwareFile(softwareDetails);

        String toUrl = "/all/queryAllSoftwareInfo";
        return new RedirectView(toUrl);
    }

    @RequestMapping("/goToUpload")
    public String goToUpload(SoftwareDetails softwareDetails, Model model){
        model.addAttribute("name", softwareDetails.getName());
        model.addAttribute("size", softwareDetails.getSize());
        //Query all the categories info
        List<Category> categories = categoryService.queryAll();
        //Add the return data to the model
        model.addAttribute("categories", categories);
        if(softwareDetails.getStatement() == null) softwareDetails.setStatement(" ");
        model.addAttribute("statement", softwareDetails.getStatement());
        model.addAttribute("url", softwareDetails.getUrl());
        //forward upload page
        return "upload";
    }

}
