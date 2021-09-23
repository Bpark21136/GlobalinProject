package com.web.travel.service;

import java.util.ArrayList;
import java.util.Map;

import com.web.travel.dto.ReviewDTO;

public interface ReviewService {
	public abstract long insertReview(ReviewDTO dto);

	public abstract Map<String, Object> getReviewList(long pid,int page);
	public abstract Map<String, Object> selectReviewById(long rid);
}
