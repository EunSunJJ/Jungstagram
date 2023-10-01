package com.sunny.jungstagram.email;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sunny.jungstagram.email.dto.EmailDto;
import com.sunny.jungstagram.email.service.EmailService;

@RestController
public class EmailRestController {

	@Autowired
	private EmailService emailService;
	
	// 이메일 보내기	
    @PostMapping("/send/email")
    
    public void sendEmail(
    		@RequestParam("email") String email
    		, @RequestParam("name") String name){
    	
        EmailDto dto = emailService.createMailAndChangePassword(email, name);
        
        emailService.mailSend(dto);
        
    }
}