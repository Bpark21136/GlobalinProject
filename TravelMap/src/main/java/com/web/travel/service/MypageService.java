package com.web.travel.service;


import com.web.travel.dto.accountDTO;

public interface MypageService {

	accountDTO selectUser(String userId);

	int updateUserInfo(accountDTO dto);

	int deleteUser(String userId);

}
