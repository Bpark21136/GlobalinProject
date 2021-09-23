package com.web.travel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

	@Override
	public Map<String, Object> getReviewList(long pid, int page) {
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("reviews",rm.getReviewList(pid,(page - 1)*5));
		ret.put("maxPage",rm.getMaxPage(pid));
		return ret;
	}

	@Override
	public Map<String, Object> selectReviewById(long rid) {
		return rm.selectReviewById(rid);
	}

}
