package com.web.travel;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.travel.dto.PointDTO;
import com.web.travel.service.PointService;
import com.web.travel.service.PointServiceImpl;

@Controller
public class MainpageController {
	private static final Logger logger = LoggerFactory.getLogger(MainpageController.class);

	@Autowired
	PointService ps;
	
	@ResponseBody
	@RequestMapping(value="/insert_point.do", method=RequestMethod.POST)
	public Map<String,String> insertPoint(@RequestBody Map<String,String> map, HttpSession session) {
	    PointDTO point = new PointDTO();
	    point.setName(map.get("name"));
	    point.setLat(Double.parseDouble(map.get("lat")));
	    point.setLng(Double.parseDouble(map.get("lng")));
	    
	    if(session.getAttribute("userId") == null) {
	    	map.put("error", "401");
	    	return map;
	    }
	    logger.debug("uesrID = " + session.getAttribute("userId").toString());
	    point.setUserID(session.getAttribute("userId").toString());
	    
	    ps.insertPoint(point);
	    long id = point.getPointID();//insert한 row의 id가 바로 매핑됨
	    logger.debug("pointid = " + id);
	    if(id == -1) {
	    	map.put("error", "500");
	    	return map;
	    }
	    map.put("pointId", Long.toString(id));
	    return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/point_search.action", method=RequestMethod.POST)
	public Map<String,Object> searchPoint(@RequestBody Map<String,String> map, HttpSession session) {
		String query = map.get("query");
		int page = Integer.parseInt(map.get("page"));
		logger.debug(query);
		logger.debug("" + page);
		if(query == null || query.trim().isEmpty())
			return null;
		
		return ps.searchPoint(query.trim() , page);	
	}
	
	@ResponseBody
	@RequestMapping(value="/point_delete.do", method=RequestMethod.POST)
	public Map<String,Object> deletePoint(@RequestBody Map<String,String> map, HttpSession session) {
		long pointID = Long.parseLong(map.get("pid"));
		logger.debug("" + pointID);
		
		String uid = session.getAttribute("userId").toString();
		if(uid == null)
			return null;
		
		int code = ps.deletePoint(pointID,uid);
		if(code != 1)
			return null;
		
		
		Map<String,Object> ret = new HashMap<String, Object>();
		ret.put("code", code);
		return ret;
		
	}
	
	
}
