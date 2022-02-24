package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Pages;
import com.music.util.Util;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Resource
    private BaseDAO<Admin> baseDAO;

    @Override
    public List<Admin> get(Pages p) {
        return baseDAO.find(Util.setPageSql("Admin", p), p.getParam(), p.getStartIndex(), p.getPageSize());
    }

}
