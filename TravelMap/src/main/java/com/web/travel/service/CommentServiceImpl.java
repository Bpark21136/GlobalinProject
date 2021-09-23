package com.web.travel.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.travel.dto.CommentDTO;
import com.web.travel.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	CommentMapper cm;
	
	@Override
	public long insertComment(CommentDTO dto) {
		// TODO Auto-generated method stub
		return cm.insertComment(dto);
	}
	
	@Override
	public ArrayList<Map<String, Object>> getCommentListByRid(long rid) {
		// TODO Auto-generated method stub
		return cm.getCommentListByRid(rid);
	}

	@Override
	public ArrayList<Map<String, Object>> getCommentListByAid(long aid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Map<String, Object>> getCommentListByUid(String uid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Map<String, Object> getCommentById(long cid) {
		// TODO Auto-generated method stub
		return cm.selectCommentById(cid);
	}

	@Override
	public int deleteReviewComment(long commentID, String uid) {
		// TODO Auto-generated method stub
		return cm.deleteReviewComment(commentID,uid);
	}

	

}
