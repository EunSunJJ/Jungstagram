package com.sunny.jungstagram.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.service.UserService;
import com.sunny.jungstagram.user.domain.User;

// API를 만드는 Controller

@RequestMapping("/user")
@RestController
public class UserRestController {

	@Autowired
	private UserService userService;
	
	
	@PostMapping("/join")
	public Map<String, String> join(
		@RequestParam("loginId") String loginId
		, @RequestParam("email") String email
		, @RequestParam("name") String name
		, @RequestParam("nickname") String nickname
		, @RequestParam("password") String password ){
	
		User user = userService.addUser(loginId, email, name, nickname, password);
	
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (user != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");			
		}
		
		return resultMap;
	}
}
