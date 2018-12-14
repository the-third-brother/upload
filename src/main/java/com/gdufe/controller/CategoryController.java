package com.gdufe.controller;

import com.gdufe.entity.Category;
import com.gdufe.entity.Entry;
import com.gdufe.service.CategoryService;
import com.gdufe.service.EntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/category")
public class CategoryController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private EntryService entryService;
    @RequestMapping("/all")
    public String queryAll(Model model){
        List<Category> categoryList = categoryService.queryAll();
        System.out.println(categoryList);
        List<Entry> entryList = entryService.queryAll();
        System.out.println(entryList);
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("entryList", entryList);

        return "edoc";
    }


    @RequestMapping("/addTo")
    public String addTo(@RequestParam("category")int cid, Model model){
        model.addAttribute("categoryId", cid);
        return "add";
    }
}
