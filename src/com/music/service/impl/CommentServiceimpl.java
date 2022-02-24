package com.music.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.music.dao.BaseDAO;
import com.music.entity.Comment;
import com.music.service.CommentService;

@Service("CommentSerivce")
public class CommentServiceimpl implements CommentService {

	@Resource
	private BaseDAO<Comment> baseDAO;

	@Override
	public void add(Comment comment) {
		baseDAO.saveOrUpdate(comment);
	}

}
