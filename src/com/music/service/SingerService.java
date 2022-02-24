package com.music.service;

import java.util.List;

import com.music.entity.*;
import com.music.util.Pages;

public interface SingerService {

    void add(Singer tt);

    void edit(Singer tt);

    Singer getById(int id);

    void del(Singer tt);

    List<Singer> get(Pages p);

    Long getCount(Pages p);
}
