package com.web.travel.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.CommentDTO;

public interface CommentMapper {
	public abstract long insertComment(CommentDTO dto);
	public abstract Map<String, Object> selectCommentById(@Param (value="commentID") long commentID);
	public abstract ArrayList<Map<String, Object>> getCommentListByRid(@Param (value="reviewID") long reviewID);
	public abstract int deleteReviewComment(@Param (value="cid") long commentID,@Param (value="uid")String uid);
}
