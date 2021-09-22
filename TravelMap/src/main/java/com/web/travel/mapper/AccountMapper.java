package com.web.travel.mapper;

import java.util.ArrayList;

import com.web.travel.dto.accountDTO;

public interface AccountMapper {
	// 로그인 확인 sql문
	public abstract int loginSelect(accountDTO dto);
	
	// 회원가입 시 회원 정보 입력 sql문
	public abstract ArrayList<accountDTO> signUpInsert(accountDTO dto);
	
	// 아이디 중복 검사 sql문
	public abstract int duIdSelect(accountDTO dto);
	
	// 이메일 중복 검사 sql문
	public abstract int duEmailSelect(accountDTO dto);
}
