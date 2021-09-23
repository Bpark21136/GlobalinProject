package com.web.travel.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.ReviewDTO;

public interface ReviewMapper {
	public abstract long insertReview(ReviewDTO dto);
	public abstract Map<String, Object> selectReviewById(@Param (value="reviewID") long reviewID);
	public abstract ArrayList<Map<String, Object>> getReviewList(@Param (value="pid")long pid,@Param (value="page") int page);
	public abstract int getMaxPage(@Param(value = "pid") long pid);
}
