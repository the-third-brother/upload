package com.gdufe.service.impl;

import com.gdufe.entity.DepositFile;
import com.gdufe.mapper.DepositMapper;
import com.gdufe.service.DepositService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("DepositService")
public class DepositServiceImpl implements DepositService {

    @Autowired
    private DepositMapper depositMapper;
    @Override
    public int addFile(DepositFile deposit) {
        return depositMapper.addFile(deposit);
    }

    @Override
    public List<DepositFile> queryAllFileInfo() {
        return depositMapper.queryAllFileInfo();
    }

    @Override
    public DepositFile downloadById(int fId) {
        return depositMapper.downloadById(fId);
    }

    @Override
    public int deleteById(int fId) {
        return depositMapper.deleteById(fId);
    }

    @Override
    public int countAllFileInfo() {
        return depositMapper.countAllFileInfo();
    }

}
