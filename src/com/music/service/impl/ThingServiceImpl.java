package com.music.service.impl;

import com.music.dao.BaseDAO;
import com.music.entity.Thing;
import com.music.service.ThingService;
import com.music.util.Pages;
import com.music.util.Util;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("ThingService")
public class ThingServiceImpl implements ThingService {

    // @Autowired
    @Resource
    private BaseDAO<Thing> baseDAO;

    @Override
    public void add(Thing tt) {
        baseDAO.save(tt);
    }

    @Override
    public void edit(Thing tt) {
        baseDAO.update(tt);
    }

    @Override
    public Thing getById(int id) {
        return baseDAO.get(Thing.class, id);
    }

    @Override
    public void del(Thing tt) {
        baseDAO.delete(tt);
    }

    @Override
    public List<Thing> get(Pages p) {
        return baseDAO.find(Util.setPageSql("Thing", p), p.getParam(), p.getStartIndex(), p.getPageSize());
    }

    @Override
    public Long getCount(Pages p) {
        return baseDAO.count(Util.setCountSql("Thing", p), p.getParam());
    }

    @Override
    public Thing getByTitle(String title) {
        return baseDAO.getByTitle("%" + title + "%");
    }
}
