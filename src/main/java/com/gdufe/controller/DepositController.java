package com.gdufe.controller;

import com.alibaba.fastjson.JSONObject;
import com.gdufe.entity.DepositFile;
import com.gdufe.service.DepositService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/deposit")
public class DepositController {

    @Autowired
    private DepositService depositService;

    @ResponseBody
    @RequestMapping("/upload")
    public JSONObject upload(MultipartFile file){
        JSONObject jsonObject = new JSONObject();
        String name = "";
        String size = "";
        String url = "";

            DepositFile deposit = new DepositFile();
            try {
                FileUtils.copyInputStreamToFile(file.getInputStream(), new File("/wuu/deposit/",
                        file.getOriginalFilename()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            size = FileUtils.byteCountToDisplaySize(file.getSize());
            name = file.getOriginalFilename();
            url = "/"+name;

            deposit.setName(name);
            deposit.setSize(size);
            deposit.setUrl(url);

            int result = depositService.addFile(deposit);
            if(result == 1)
            {
                jsonObject.put("code", 0);
                return jsonObject;
            }
        return jsonObject;
    }

    @RequestMapping("/queryAllFileInfo")
    public String queryAllFileInfo(Model model){
        List<DepositFile> depositFiles = depositService.queryAllFileInfo();
        int count = depositService.countAllFileInfo();
        model.addAttribute("depositFiles", depositFiles);
        model.addAttribute("count", count);

        return "download";
    }

    @ResponseBody
    @RequestMapping("/downloadById")
    public JSONObject downloadById(int fId){
        JSONObject jsonObject = new JSONObject();

        DepositFile file = depositService.downloadById(fId);
        String url = "/depositFiles"+file.getUrl();

        jsonObject.put("url", url);

        return jsonObject;
    }

    @ResponseBody
    @RequestMapping("/deleteById")
    public JSONObject deleteById(int fId){
        JSONObject jsonObject = new JSONObject();
        int result = depositService.deleteById(fId);
        jsonObject.put("url", "/deposit/queryAllFileInfo");
        return jsonObject;
    }
}
