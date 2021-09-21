package com.web.travel.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.PointDTO;



public interface PointMapper {
	public abstract long insertPoint(PointDTO dto) throws Exception;
	public abstract ArrayList<PointDTO> searchPoint(@Param(value = "query") String query,@Param(value = "page") int page) throws Exception;
	public abstract int getMaxPage(@Param(value = "query") String query) throws Exception;
}
