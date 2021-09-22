package com.web.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.travel.dto.PointDTO;
import com.web.travel.dto.ReviewDTO;
import com.web.travel.mapper.ReviewMapper;

@Service
public class ReviewServiceImpl implements  ReviewService {

	@Autowired
	ReviewMapper rm;
	
	@Override
	public long insertReview(ReviewDTO dto) {
		rm.insertReview(dto);
		
		return dto.getReviewID();
	}

}
