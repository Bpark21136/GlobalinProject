package com.web.travel.service;

import java.util.ArrayList;
import java.util.Map;

import com.web.travel.dto.CommentDTO;

public interface CommentService {
	public abstract long insertComment(CommentDTO dto);
	public abstract Map<String, Object> getCommentById(long cid);
	public abstract ArrayList<Map<String, Object>> getCommentListByRid(long rid);
	public abstract ArrayList<Map<String, Object>> getCommentListByAid(long aid);
	public abstract ArrayList<Map<String, Object>> getCommentListByUid(String uid);
	public int deleteReviewComment(long commentID, String uid);
}
