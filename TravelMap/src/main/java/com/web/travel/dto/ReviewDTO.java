package com.web.travel.dto;

import java.util.Date;

public class ReviewDTO {
	private long reviewID;
	private String title;
	private String preview;
	private String content;
	private Date date;
	private String userID;
	private long pointID;
	
	
	public long getReviewID() {
		return reviewID;
	}
	public void setReviewID(long reviewID) {
		this.reviewID = reviewID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPreview() {
		return preview;
	}
	public void setPreview(String preview) {
		this.preview = preview;
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
	public long getPointID() {
		return pointID;
	}
	public void setPointID(long pointID) {
		this.pointID = pointID;
	}
}
