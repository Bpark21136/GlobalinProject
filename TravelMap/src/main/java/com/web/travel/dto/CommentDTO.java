package com.web.travel.dto;

import java.util.Date;

public class CommentDTO {
	long commentID;
	String content;
	Date date;
	String userID;
	Long reviewID;//null일 수도 있음
	Long articleID;//null일 수도 있음
	
	
	public long getCommentID() {
		return commentID;
	}
	public void setCommentID(long commentID) {
		this.commentID = commentID;
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
	public Long getReviewID() {
		return reviewID;
	}
	public void setReviewID(Long reviewID) {
		this.reviewID = reviewID;
	}
	public Long getArticleID() {
		return articleID;
	}
	public void setArticleID(Long articleID) {
		this.articleID = articleID;
	}
}
