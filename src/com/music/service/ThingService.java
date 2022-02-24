package com.music.service;

import com.music.entity.Thing;
import com.music.util.Pages;

import java.util.List;

public interface ThingService {

    void add(Thing tt);

    void edit(Thing tt);

    Thing getById(int id);

    Thing getByTitle(String title);

    void del(Thing tt);

    List<Thing> get(Pages p);

    Long getCount(Pages p);
}
