package com.gdufe.mapper;

import com.gdufe.entity.DepositFile;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface DepositMapper {
    int addFile(DepositFile deposit);

    List<DepositFile> queryAllFileInfo();

    DepositFile downloadById(int fId);

    int deleteById(int fId);

    int countAllFileInfo();
}
