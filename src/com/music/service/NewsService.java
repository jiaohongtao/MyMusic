package com.music.service;

import com.music.entity.News;
import com.music.util.Pages;

import java.util.List;

public interface NewsService {

    void add(News tt);

    void edit(News tt);

    News getById(int id);

    void del(News tt);

    List<News> get(Pages p);

    Long getCount(Pages p);
}
