package com.gdufe.service;

import com.gdufe.entity.Category;
import com.gdufe.entity.SoftwareDetails;

import java.util.List;

public interface SoftwareService {

    List<SoftwareDetails> queryAllSoftwareInfo();

    String getURLById(int sId);

    int countDownload(int sId);

    int deleteById(int sId);

    int addCategory(String cName);

    List<Category> queryCategories();

    int modifyCategoryById(int cId, String name);

    int deleteCategoryById(int cId);

    int addCategoryByName(String name);

    SoftwareDetails querySoftwareInfoById(int sId);

    int updateSoftwareInfoById(SoftwareDetails software);

    int countAllSoftwareInfo();
}
