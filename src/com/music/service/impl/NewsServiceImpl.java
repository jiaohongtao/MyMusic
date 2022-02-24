package com.music.service.impl;

import com.music.dao.BaseDAO;
import com.music.entity.News;
import com.music.service.NewsService;
import com.music.util.Pages;
import com.music.util.Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("NewsService")
public class NewsServiceImpl implements NewsService {

    @Resource
    private BaseDAO<News> baseDAO;

    @Override
    public void add(News tt) {
        baseDAO.save(tt);
    }

    @Override
    public void edit(News tt) {
        baseDAO.update(tt);
    }

    @Override
    public News getById(int id) {
        return baseDAO.get(News.class, id);
    }

    @Override
    public void del(News tt) {
        baseDAO.delete(tt);
    }

    @Override
    public List<News> get(Pages p) {
        return baseDAO.find(Util.setPageSql("News", p), p.getParam(), p.getStartIndex(), p.getPageSize());
    }

    @Override
    public Long getCount(Pages p) {
        return baseDAO.count(Util.setCountSql("News", p), p.getParam());
    }

}
