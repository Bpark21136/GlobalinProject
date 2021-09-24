package com.web.travel.service;

import java.util.ArrayList;
import java.util.Map;

import com.web.travel.dto.ArticleDTO;
import com.web.travel.dto.ReviewDTO;

public interface ArticleService {

	ArrayList<Map<String, Object>> getArticleList(String query, int page);
	long insertArticle(ArticleDTO dto);
	Map<String, Object> selectArticleById(long aid);
	int getMaxPage(String query);
	int deleteArticle(long articleID, String uid);
	long updateArticle(ArticleDTO dto);

}
