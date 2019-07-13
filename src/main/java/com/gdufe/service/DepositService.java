package com.gdufe.service;

import com.gdufe.entity.DepositFile;

import java.util.List;

public interface DepositService {
    int addFile(DepositFile deposit);

    List<DepositFile> queryAllFileInfo();

    DepositFile downloadById(int fId);

    int deleteById(int fId);

    int countAllFileInfo();
}
