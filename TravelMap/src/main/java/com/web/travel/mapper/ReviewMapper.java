package com.web.travel.mapper;

import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.ReviewDTO;

public interface ReviewMapper {
	public abstract long insertReview(ReviewDTO dto);
	public abstract ReviewDTO selectReviewById(@Param (value="reviewID") long reviewID);
}
