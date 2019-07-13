package com.gdufe.service.impl;

import com.gdufe.entity.SoftwareDetails;
import com.gdufe.mapper.UploadMapper;
import com.gdufe.service.UploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("uploadService")
public class UploadServiceImpl implements UploadService {

    @Autowired
    private UploadMapper uploadMapper;

    public Boolean addSoftwareFile(SoftwareDetails softwareDetails){
        int row = uploadMapper.addSoftwareFile(softwareDetails);
        return row==1?true:false;
    }
}
