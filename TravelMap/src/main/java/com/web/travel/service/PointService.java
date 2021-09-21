package com.web.travel.service;

import java.util.Map;

import com.web.travel.dto.PointDTO;

public interface PointService {
	public abstract long insertPoint(PointDTO dto);
	public abstract int getMaxPage(String query);
	public abstract Map<String,Object> searchPoint(String query,int page);
}
