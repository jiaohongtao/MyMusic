package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Util;

@Service("ThingTypeService")
public class ThingTypeServiceImpl implements ThingTypeService {

	@Resource
	private BaseDAO<ThingType> baseDAO;

	@Override
	public void add(ThingType tt) {
		baseDAO.save(tt);
	}

	@Override
	public void edit(ThingType tt) {
		baseDAO.update(tt);
	}

	@Override
	public ThingType getById(int id) {
		return baseDAO.get(ThingType.class, id);
	}

	@Override
	public void del(ThingType tt) {
		baseDAO.delete(tt);
	}

	@Override
	public List<ThingType> get(int startIndex, int pageSize, String key) {
		return baseDAO.find(" from ThingType" + Util.setKey(key));
	}

	@Override
	public Long getCount(String key) {
		return baseDAO.count(" from ThingType" + Util.setKey(key));
	}


}
