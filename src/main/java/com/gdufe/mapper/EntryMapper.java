package com.gdufe.mapper;

import com.gdufe.entity.Entry;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

public interface EntryMapper {
    List<Entry> queryAll();

    List<Entry> queryByCategoryId(Integer cid);

    int addTo(Entry entry);

    Entry queryById(int id);

    int update(Entry entry);

    int delById(int id);
}
