package com.web.travel.modelDAO;

import org.apache.commons.codec.digest.DigestUtils;

public class SecurityConfig {
	
	public String encryptionMain(String password) {
		
		String encstr = "";
		encstr = DigestUtils.md5Hex(password);
		
		return encstr;
	}
}