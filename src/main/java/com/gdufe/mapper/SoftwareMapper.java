package com.gdufe.mapper;

import com.gdufe.entity.Category;
import com.gdufe.entity.SoftwareDetails;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SoftwareMapper {
    List<SoftwareDetails> queryAllSoftwareInfo();

    String getURLById(int sId);

    int countDownload(int sId);

    int deleteById(int sId);

    int addCategory(String cName);

    List<Category> queryCategories();

    int modifyCategoryById(@Param("cId") int cId, @Param("name") String name);

    int deleteCategoryById(int cId);

    int addCategoryByName(String name);

    SoftwareDetails querySoftwareInfoById(int sId);

    int updateSoftwareInfoById(SoftwareDetails software);

    int countAllSoftwareInfo();
}
