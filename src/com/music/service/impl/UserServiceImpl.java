package com.music.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.*;
import com.music.service.*;
import com.music.util.Pages;
import com.music.util.Util;

@Service("UserService")
public class UserServiceImpl implements UserService {

	@Resource
	private BaseDAO<User> baseDAO;

	@Override
	public void add(User tt) {
		baseDAO.save(tt);
	}

	@Override
	public void edit(User tt) {
		baseDAO.update(tt);
	}

	@Override
	public User getById(int id) {
		return baseDAO.get(User.class, id);
	}

	@Override
	public void del(User tt) {
		baseDAO.delete(tt);
	}

	@Override
	public List<User> get(Pages p) {
		return baseDAO.find(Util.setPageSql("User", p), p.getParam(), p.getStartIndex(), p.getPageSize());
	}


	@Override
	public Long getCount(Pages p) {
		return baseDAO.count(Util.setCountSql("User", p), p.getParam());
	}

	@Override
	public Integer editPwd(int id, String pwd) {
		return baseDAO.executeHql("update User set pwd=? where id=?", new Object[]{pwd, id});
	}

}
