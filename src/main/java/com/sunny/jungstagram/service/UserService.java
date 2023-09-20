package com.sunny.jungstagram.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.repository.UserRepository;
import com.sunny.jungstagram.user.domain.User;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;
	
	
	public User addUser(
			String loginId
			, String email
			, String name
			, String nickname
			, String password) {
		
		 User user = User.builder()
		.loginId(loginId)
		.email(email)
		.name(name)
		.nickname(nickname)
		.password(password)
		.build();
		
		return userRepository.save(user);
		
	}
}
