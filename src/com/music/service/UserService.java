package com.music.service;

import com.music.entity.User;
import com.music.util.Pages;

import java.util.List;

public interface UserService {

    void add(User user);

    void edit(User user);

    User getById(int id);

    void del(User user);

    List<User> get(Pages p);

    Long getCount(Pages p);

    Integer editPwd(int id, String pwd);
}
