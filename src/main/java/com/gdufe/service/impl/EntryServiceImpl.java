package com.gdufe.service.impl;

import com.gdufe.entity.Category;
import com.gdufe.entity.Entry;
import com.gdufe.mapper.EntryMapper;
import com.gdufe.service.EntryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("entryService")
public class EntryServiceImpl implements EntryService {
    @Autowired
    private EntryMapper entryMapper;
    @Override
    public List<Entry> queryAll() {
        return entryMapper.queryAll();
    }

    @Override
    public List<Entry> queryByCategoryId(Integer cid) {
        System.out.println("entry Service:"+cid);
        return entryMapper.queryByCategoryId(cid);
    }

    @Override
    public Boolean addTo(Entry entry) {
        return entryMapper.addTo(entry)==1?true:false;
    }

    @Override
    public Entry queryById(int id) {
        return entryMapper.queryById(id);
    }

    @Override
    public Boolean update(Entry entry) {
        return entryMapper.update(entry)==1?true:false;
    }

    @Override
    public Boolean delById(int id) {
        return entryMapper.delById(id)==1?true:false;
    }
}
