package com.sunny.jungstagram.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.service.UserService;
import com.sunny.jungstagram.user.domain.User;

// API를 만드는 Controller

@RestController
@RequestMapping("/user")
public class UserRestController {

	@Autowired
	private UserService userService;
	
	// 로그인 
	@PostMapping("/login")
	public Map<String, String> login(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpSession session) {
		
		User user = userService.getUser(loginId, password);
		
		// response
		Map<String, String> resultMap = new HashMap<>();
		if (user != null) {
			// 로그인 성공
			
			// session에 저장 될 데이터는 최소화
			// Id 컬럼값 , nickname 담기	
			session.setAttribute("userId", user.getId()); 
			session.setAttribute("userNickname", user.getNickname()); 
			
			resultMap.put("result", "success");
		} else {
			
			// 로그인 실패
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	// 아이디 중복확인
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicateId(
			@RequestParam("loginId") String loginId) {

		boolean isDuplicate = userService.isDuplicateId(loginId);
		
		// response
		Map<String, Boolean> resultMap = new HashMap<>();
		if (isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}
		
		return resultMap;
	}
	
	
	// 회원가입
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
