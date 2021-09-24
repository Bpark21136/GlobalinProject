package com.web.travel.dto;

import java.util.Date;

public class ArticleDTO {
	private long articleID;
	private String title;
	private String content;
	private Date date;
	private String userID;
	
	public long getArticleID() {
		return articleID;
	}
	public void setArticleID(long articleID) {
		this.articleID = articleID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
