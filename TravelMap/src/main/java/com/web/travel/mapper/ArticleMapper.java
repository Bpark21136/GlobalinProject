package com.web.travel.mapper;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.ArticleDTO;

public interface ArticleMapper {
	public abstract long insertArticle(ArticleDTO dto);
	public abstract Map<String, Object> selectArticleById(@Param (value="articleID") long articleID);
	public abstract ArrayList<Map<String, Object>> getArticleList(@Param (value="query")String query,@Param (value="page") int page);
	public abstract int getMaxPage(@Param(value = "query") String query);
	public abstract int deleteArticle(@Param(value = "aid") long articleID, @Param(value = "uid") String uid);
	public abstract long updateArticle(ArticleDTO dto);
	public abstract int getMaxPageByUid(@Param(value = "uid")String uid);
	public abstract ArrayList<Map<String, Object>> getArticleListByUid(@Param(value = "uid")String userId,@Param (value="page") int page);
}
