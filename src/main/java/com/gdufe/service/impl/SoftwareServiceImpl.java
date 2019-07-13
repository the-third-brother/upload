package com.gdufe.service.impl;

import com.gdufe.entity.Category;
import com.gdufe.entity.SoftwareDetails;
import com.gdufe.mapper.SoftwareMapper;
import com.gdufe.service.SoftwareService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("softwareService")
public class SoftwareServiceImpl implements SoftwareService {

    @Autowired
    private SoftwareMapper softwareMapper;
    @Override
    public List<SoftwareDetails> queryAllSoftwareInfo() {


        return softwareMapper.queryAllSoftwareInfo();
    }

    @Override
    public String getURLById(int sId) {
        return softwareMapper.getURLById(sId);
    }

    @Override
    public int countDownload(int sId) {
        return softwareMapper.countDownload(sId);
    }

    @Override
    public int deleteById(int sId) {
        return softwareMapper.deleteById(sId);
    }

    @Override
    public int addCategory(String cName) {
        return softwareMapper.addCategory(cName);
    }

    @Override
    public List<Category> queryCategories() {
        return softwareMapper.queryCategories();
    }

    @Override
    public int modifyCategoryById(int cId, String name) {
        return softwareMapper.modifyCategoryById(cId, name);
    }

    @Override
    public int deleteCategoryById(int cId) {
        return softwareMapper.deleteCategoryById(cId);
    }

    @Override
    public int addCategoryByName(String name) {
        return softwareMapper.addCategoryByName(name);
    }

    @Override
    public SoftwareDetails querySoftwareInfoById(int sId) {
        return softwareMapper.querySoftwareInfoById(sId);
    }

    @Override
    public int updateSoftwareInfoById(SoftwareDetails software) {
        return softwareMapper.updateSoftwareInfoById(software);
    }

    @Override
    public int countAllSoftwareInfo() {
        return softwareMapper.countAllSoftwareInfo();
    }
}
