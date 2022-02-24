package com.music.service;

import com.music.entity.NewsType;

import java.util.List;

public interface NewsTypeService {

    void add(NewsType tt);

    void edit(NewsType tt);

    NewsType getById(int id);

    void del(NewsType tt);

    List<NewsType> get(int startindex, int pagesize, String key);

    Long getCount(String key);
}
