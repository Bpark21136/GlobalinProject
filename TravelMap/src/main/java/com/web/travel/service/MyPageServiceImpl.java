package com.web.travel.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.travel.dto.accountDTO;
import com.web.travel.mapper.MypageMapper;

@Service
public class MyPageServiceImpl implements MypageService {

	@Autowired
	MypageMapper mm;
	
	
	@Override
	public accountDTO selectUser(String userId) {
		// TODO Auto-generated method stub
		return mm.selectUser(userId);
	}


	@Override
	public int updateUserInfo(accountDTO dto) {
		// TODO Auto-generated method stub
		return mm.updateUser(dto);
	}


	@Override
	public int deleteUser(String uid) {
		// TODO Auto-generated method stub
		return mm.deleteUser(uid);
	}

}
