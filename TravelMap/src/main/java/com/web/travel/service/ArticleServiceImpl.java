package com.web.travel.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.travel.dto.ArticleDTO;
import com.web.travel.dto.ReviewDTO;
import com.web.travel.mapper.ArticleMapper;

@Service
public class ArticleServiceImpl implements ArticleService{

	@Autowired
	ArticleMapper am;
	
	@Override
	public ArrayList<Map<String, Object>> getArticleList(String query, int page) {
		// TODO Auto-generated method stub
		return am.getArticleList(query, (page- 1) * 10);
	}

	@Override
	public long insertArticle(ArticleDTO dto) {
		// TODO Auto-generated method stub
		if(am.insertArticle(dto) != 1)
			return -1;
		
		return dto.getArticleID();
	}

	@Override
	public Map<String, Object> selectArticleById(long aid) {
		// TODO Auto-generated method stub
		return am.selectArticleById(aid);
	}

	@Override
	public int getMaxPage(String query) {
		// TODO Auto-generated method stub
		return am.getMaxPage(query);
	}

	@Override
	public int deleteArticle(long articleID, String uid) {
		// TODO Auto-generated method stub
		return am.deleteArticle(articleID, uid);
	}

	@Override
	public long updateArticle(ArticleDTO dto) {
		// TODO Auto-generated method stub
		return am.updateArticle(dto);
	}

}
