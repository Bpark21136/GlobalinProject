package com.web.travel.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.travel.MainpageController;
import com.web.travel.dto.PointDTO;
import com.web.travel.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService {
	
	private static final Logger logger = LoggerFactory.getLogger(PointServiceImpl.class);
	@Autowired
	private PointMapper pointMapper;
	
	@Override
	public long insertPoint(PointDTO dto) {
		try {
			return pointMapper.insertPoint(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public int getMaxPage(String query) {
		// TODO Auto-generated method stub
		try {
			return pointMapper.getMaxPage(query);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public Map<String, Object> searchPoint(String query, int page) {
		logger.debug("searchPoint");
		Map<String, Object> ret = new HashMap<String, Object>();
		if(page > getMaxPage(query)) {
			logger.error("page is bigger than maxPage");
			return null;
		}
			
		try {
			ArrayList<PointDTO> points = pointMapper.searchPoint(query, (page-1)*10);
			ArrayList<Map<String,Object>> pointMapList = new ArrayList<Map<String,Object>>();
			for(PointDTO point : points) {
				Map<String,Object> pointMap = new HashMap<String, Object>();
				pointMap.put("pointID",point.getPointID());
				pointMap.put("name",point.getName());
				pointMap.put("lat",point.getLat());
				pointMap.put("lng",point.getLng());
				pointMap.put("userID",point.getUserID());
				pointMapList.add(pointMap);
			}
			ret.put("points", pointMapList);
			ret.put("maxPage",getMaxPage(query));
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public int deletePoint(long pointID,String userID) {
		try {
			return pointMapper.deletePoint(pointID,userID);
		} catch (Exception e) {
			return 0;
		}
		
	}

}
