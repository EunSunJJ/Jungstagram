package com.sunny.jungstagram.email.repository;

import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.email.dto.EmailDto;

@Repository
public interface EmailRepository {

	// email로 userId 정보 가져오기?
	public EmailDto findUserByUserId(String email);
	
	// 임시 비밀번호로 비밀번호 변경
	public void updateUserPassword(int id, String pw);

	

}
