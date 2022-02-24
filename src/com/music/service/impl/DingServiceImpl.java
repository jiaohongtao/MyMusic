package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Pages;
import com.music.util.Util;

@Service("DingService")
public class DingServiceImpl implements DingService {

	@Resource
	private BaseDAO<Ding> baseDAO;

	@Override
	public void add(Ding tt) {
		baseDAO.save(tt);
	}


	@Override
	public Ding getById(int id) {
		return baseDAO.get(Ding.class, id);
	}

	@Override
	public void del(Ding tt) {
		baseDAO.delete(tt);
	}


	@Override
	public List<Ding> get(Pages p) {
		return baseDAO.find(Util.setPageSql("Ding", p), p.getParam(), p.getStartIndex(), p.getPageSize());
	}

	@Override
	public Long getCount(Pages p) {
		return baseDAO.count(Util.setCountSql("Ding", p), p.getParam());
	}


}
