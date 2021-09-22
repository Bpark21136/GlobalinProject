package com.web.travel.dto;

public class PointDTO {
	private long pointID;
	private String name;
	private double lat;
	private double lng;
	private String userID;
	
	public long getPointID() {
		return pointID;
	}
	public void setPointID(long pointID) {
		this.pointID = pointID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
}
