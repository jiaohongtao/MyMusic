package com.music.service;

import com.music.entity.Introduce;

import java.util.List;

public interface IntroduceService {

    void add(Introduce tt);

    void edit(Introduce tt);

    Introduce getById(int id);

    void del(Introduce tt);

    List<Introduce> get();

    Long getCount(String key);
}
