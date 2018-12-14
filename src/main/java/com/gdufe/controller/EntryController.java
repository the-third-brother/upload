package com.gdufe.controller;

import com.gdufe.entity.Category;
import com.gdufe.entity.Entry;
import com.gdufe.service.CategoryService;
import com.gdufe.service.EntryService;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/entry")
public class EntryController {
    @Autowired
    private EntryService entryService;
    @Autowired
    private CategoryService categoryService;
    @RequestMapping("/byCid")
    public String queryByCategoryId(@RequestParam("category") Integer cid, Model model){
//        int cid = Integer.parseInt(categoryId);
        if (cid == null || cid == 0){
            cid = null;
        }
        System.out.println(cid);
        List<Entry> entryList = entryService.queryByCategoryId(cid);
        System.out.println(entryList);
        List<Category> categoryList = categoryService.queryAll();
        model.addAttribute("entryList", entryList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("cid", cid);
        return "edoc";
    }

    @RequestMapping("/addTo")
    public String addTo(Entry entry, Model model){
        System.out.println("调用了addTo controller");
        System.out.println(entry);
        Boolean addFlag = entryService.addTo(entry);

        //返回电子文档列表，并显示添加成功与否
        List<Category> categoryList = categoryService.queryAll();
        List<Entry> entryList = entryService.queryByCategoryId(entry.getCategory().getId());
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("entryList", entryList);
        model.addAttribute("cid", entry.getCategory().getId());
        model.addAttribute("addFlag", addFlag);
        return "edoc";
    }

    @RequestMapping("/updateTo/{id}")
    public String updateTo(@PathVariable("id") int id, Model model){

        //根据文档id查询文档信息
        Entry entry = entryService.queryById(id);
        //跳转到更新文档页面，并显示查询到的信息
        model.addAttribute("entry", entry);
        return "update";
    }

    @RequestMapping("/update")
    public String update(Entry entry, Model model){
        System.out.println("update:"+entry);
        Boolean updateFlag = entryService.update(entry);

        List<Entry> entryList = entryService.queryAll();
        List<Category> categoryList = categoryService.queryAll();
        model.addAttribute("updateFlag", updateFlag);
        model.addAttribute("entryList",entryList);
        model.addAttribute("categoryList",categoryList);
        return "edoc";
    }

    @RequestMapping("/del/{id}")
    public String delById(@PathVariable int id, Model model){
        Boolean delFlag = entryService.delById(id);
        List<Entry> entryList = entryService.queryAll();
        List<Category> categoryList = categoryService.queryAll();

        model.addAttribute("delFlag",delFlag);
        model.addAttribute("entryList",entryList);
        model.addAttribute("categoryList",categoryList);
        return "edoc";
    }


}
