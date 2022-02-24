package com.music.service;

import com.music.entity.ThingType;

import java.util.List;

public interface ThingTypeService {

    void add(ThingType tt);

    void edit(ThingType tt);

    ThingType getById(int id);

    void del(ThingType tt);

    List<ThingType> get(int startIndex, int pageSize, String key);

    Long getCount(String key);
}
