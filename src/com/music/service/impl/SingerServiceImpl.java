package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Pages;
import com.music.util.Util;

@Service("SingerService")
public class SingerServiceImpl implements SingerService {

	@Resource
	private BaseDAO<Singer> baseDAO;

	@Override
	public void add(Singer tt) {
		baseDAO.save(tt);
	}

	@Override
	public void edit(Singer tt) {
		baseDAO.update(tt);
	}

	@Override
	public Singer getById(int id) {
		return baseDAO.get(Singer.class, id);
	}

	@Override
	public void del(Singer tt) {
		baseDAO.delete(tt);
	}

	@Override
	public List<Singer> get(Pages p) {
		return baseDAO.find(Util.setPageSql("Singer", p), p.getParam(), p.getStartIndex(), p.getPageSize());
	}

	@Override
	public Long getCount(Pages p) {
		return baseDAO.count(Util.setCountSql("Singer", p), p.getParam());
	}


}
