package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Util;

@Service("NewsTypeService")
public class NewsTypeServiceImpl implements NewsTypeService {

	@Resource
	private BaseDAO<NewsType> baseDAO;

	@Override
	public void add(NewsType tt) {
		baseDAO.save(tt);
	}

	@Override
	public void edit(NewsType tt) {
		baseDAO.update(tt);
	}

	@Override
	public NewsType getById(int id) {
		return baseDAO.get(NewsType.class, id);
	}

	@Override
	public void del(NewsType tt) {
		baseDAO.delete(tt);
	}

	@Override
	public List<NewsType> get(int startindex, int pagesize, String key) {
		return baseDAO.find(" from NewsType" + Util.setKey(key));
	}

	@Override
	public Long getCount(String key) {
		return baseDAO.count(" from NewsType" + Util.setKey(key));
	}


}
