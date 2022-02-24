package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Util;

@Service("IntroduceService")
public class IntroduceServiceImpl implements IntroduceService {

	@Resource
	private BaseDAO<Introduce> baseDAO;

	@Override
	public void add(Introduce tt) {
		baseDAO.save(tt);
	}

	@Override
	public void edit(Introduce tt) {
		baseDAO.update(tt);
	}

	@Override
	public Introduce getById(int id) {
		return baseDAO.get(Introduce.class, id);
	}

	@Override
	public void del(Introduce tt) {
		baseDAO.delete(tt);
	}

	@Override
	public List<Introduce> get() {
		return baseDAO.find(" from Introduce");
	}

	@Override
	public Long getCount(String key) {
		return baseDAO.count(" from Introduce" + Util.setKey(key));
	}


}
