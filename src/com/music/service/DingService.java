package com.music.service;

import com.music.entity.Ding;
import com.music.util.Pages;

import java.util.List;

public interface DingService {

    void add(Ding d);

    void del(Ding d);

    Ding getById(int id);

    List<Ding> get(Pages p);

    Long getCount(Pages p);
}
