package com.gdufe.service;

import com.gdufe.entity.Category;
import com.gdufe.entity.Entry;

import java.util.List;

public interface EntryService {
    List<Entry> queryAll();

    List<Entry> queryByCategoryId(Integer cid);

    Boolean addTo(Entry entry);

    Entry queryById(int id);

    Boolean update(Entry entry);

    Boolean delById(int id);
}
