package com.music.service;

import com.music.entity.Admin;
import com.music.util.Pages;

import java.util.List;

public interface AdminService {

    List<Admin> get(Pages p);
}
