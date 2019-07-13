package com.gdufe.controller;

import com.alibaba.fastjson.JSONObject;
import com.gdufe.entity.Category;
import com.gdufe.entity.SoftwareDetails;
import com.gdufe.service.CategoryService;
import com.gdufe.service.SoftwareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/all")
public class SoftwareController {

    @Autowired
    private SoftwareService softwareService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }

    @RequestMapping("/queryAllSoftwareInfo")
    public String queryAllSoftwareInfo(Model model, HttpServletRequest request){
        HttpSession session = request.getSession();
        List<SoftwareDetails> softwareDetailsList = softwareService.queryAllSoftwareInfo();
        int count = softwareService.countAllSoftwareInfo();
        session.setAttribute("softwareDetailsList", softwareDetailsList);
        session.setAttribute("count",count);
        return "index";
    }

    @ResponseBody
    @RequestMapping("/download")
    public JSONObject download(int sId){
        JSONObject jsonObject = new JSONObject();
        String url = "/software"+softwareService.getURLById(sId);
        int result = softwareService.countDownload(sId);
        if(result == 1)
        {
            jsonObject.put("url", url);
            return jsonObject;
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping("/delete")
    public JSONObject delete(int sId){
        JSONObject jsonObject = new JSONObject();
        int result = softwareService.deleteById(sId);
        if(result == 1)
        {
            jsonObject.put("url", "/all/queryAllSoftwareInfo");
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping("/queryCategories")
    public String queryCategories(Model model){
        List<Category> categories = softwareService.queryCategories();

        if(categories != null)
        {
            System.out.println(categories);
            model.addAttribute("categories", categories);
            return "category";
        }
        return "index";
    }

    @ResponseBody
    @RequestMapping("/addCategory")
    public JSONObject addCategory(String cName, String name, String statement, String size){
        JSONObject jsonObject = new JSONObject();
        if(statement == null) statement = " ";
        int result = softwareService.addCategory(cName);
        if(result == 1)
        {
            jsonObject.put("size", size);
            jsonObject.put("name", name);
            jsonObject.put("statement", statement);
            jsonObject.put("url", "/upload/goToUpload");
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping("/modifyCategoryById")
    public JSONObject modifyCategoryById(int cId, String name){
        JSONObject jsonObject = new JSONObject();
        int result = softwareService.modifyCategoryById(cId, name);
        if(result == 1){
            jsonObject.put("url", "/all/queryCategories");
            return jsonObject;
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping("/deleteCategoryById")
    public JSONObject deleteCategoryById(int cId){
        JSONObject jsonObject = new JSONObject();
        int result = softwareService.deleteCategoryById(cId);
        if(result == 1)
        {
            jsonObject.put("url", "/all/queryCategories");
            return jsonObject;
        }
        return jsonObject;
    }

    @ResponseBody
    @RequestMapping("/addCategoryByName")
    public JSONObject addCategoryByName(String name){
        JSONObject jsonObject = new JSONObject();
        int result = softwareService.addCategoryByName(name);
        if(result == 1){
            jsonObject.put("url", "/all/queryCategories");
            return jsonObject;
        }
        return jsonObject;
    }

    @RequestMapping("/toModifySoftwareById")
    public String toModifySoftwareById(int sId, Model model){
        SoftwareDetails software = softwareService.querySoftwareInfoById(sId);

        List<Category> categories = categoryService.queryAll();
        //Add the return data to the model
        model.addAttribute("categories", categories);
        model.addAttribute("software", software);

        return "modify";
    }

    @RequestMapping("updateSoftwareInfoById")
    public String updateSoftwareInfoById(SoftwareDetails software){
        System.out.println(software);
        int result = softwareService.updateSoftwareInfoById(software);
        System.out.println(result);

        return "index";
    }
}
