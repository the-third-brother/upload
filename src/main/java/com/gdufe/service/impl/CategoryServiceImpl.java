package com.gdufe.service.impl;

import com.gdufe.entity.Category;
import com.gdufe.mapper.CategoryMapper;
import com.gdufe.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("categoryService")
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private CategoryMapper categoryMapper;
    @Override
    public List<Category> queryAll() {

        return categoryMapper.queryAll();
    }
}
