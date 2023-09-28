package com.sunny.jungstagram.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.common.EncryptUtils;
import com.sunny.jungstagram.user.domain.User;
import com.sunny.jungstagram.user.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	
	// UserId를 기반으로 user정보를 얻어온다
	public User getUserById(int id) {
		User user = userRepository.findById(id).orElse(null);
		return user;
	}
	
	// 로그인
	public User getUser(String loginId, String password){
		
	// password 암호화
	String encryptPassword = EncryptUtils.md5(password);
		
	User user = userRepository.findByLoginIdAndPassword(loginId, encryptPassword).orElse(null);
		
	return user;
}

	// 아이디 중복확인
	public boolean isDuplicateId(String loginId) {
		
		// 0 인지 아닌지만 판단
		int count = userRepository.countByLoginId(loginId);
		
		// return값이 boolean이니까
		if (count == 0) {
			return false;
		} else {
			return true;
			
		}
	}
	
	// 회원가입
	public User addUser(
			String loginId
			, String email
			, String name
			, String nickname
			, String password) {
		
		// 비밀번호 암호화
		String encryptPassword = EncryptUtils.md5(password);
		
		User user = User.builder()
						.loginId(loginId)
						.email(email)
						.name(name)
						.nickname(nickname)
						.password(encryptPassword)
						.build();
	

		 
		 return userRepository.save(user);
		
	}
}
