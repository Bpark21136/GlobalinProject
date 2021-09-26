package com.web.travel.mapper;

import org.apache.ibatis.annotations.Param;

import com.web.travel.dto.accountDTO;

public interface MypageMapper {
	public abstract accountDTO selectUser(@Param (value="uid") String uid);

	public abstract int updateUser(accountDTO dto);

	public abstract int deleteUser(@Param (value="uid") String uid);
}
