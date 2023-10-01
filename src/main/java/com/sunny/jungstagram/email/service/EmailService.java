package com.sunny.jungstagram.email.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.sunny.jungstagram.common.EncryptUtils;
import com.sunny.jungstagram.email.dto.EmailDto;
import com.sunny.jungstagram.email.repository.EmailRepository;

@Service
public class EmailService {

	@Autowired
	private EmailRepository emailRepository;

	private JavaMailSender mailSender;
	private static final String FROM_ADDRESS = "developtest0122@naver.com";

	
	// 메일 내용을 생성하고 임시 비밀번호로 회원 비밀번호를 변경
	public EmailDto createMailAndChangePassword(String email, String name) {
		String tempPassword = getTempPassword();
		
		EmailDto dto = new EmailDto();
		
		dto.setAddress(email);
		dto.setTitle(name + "님의 HOTTHINK 임시비밀번호 안내 이메일 입니다.");
		dto.setMessage("안녕하세요. HOTTHINK 임시비밀번호 안내 관련 이메일 입니다." + "[" + name + "]" + "님의 임시 비밀번호는 " + tempPassword + " 입니다.");
		
		updatePassword(tempPassword, email);
		return dto;
	}

	// 임시 비밀번호로 비밀번호 변경
	public void updatePassword(String tempPassword, String email) {
		String EncryptTempPassword = EncryptUtils.md5(tempPassword);
		
		int userId = emailRepository.findUserByUserId(email).getId();
		emailRepository.updateUserPassword(userId, EncryptTempPassword);
	}
	

	// 랜덤함수로 임시비밀번호 구문 만들기
	public String getTempPassword(){
	        char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F',
	                'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' };

	        String str = "";

	        int idx = 0;
	        for (int i = 0; i < 10; i++) {
	            idx = (int) (charSet.length * Math.random());
	            str += charSet[idx];
	        }
	        return str;
	    }
	
	
	// 메일 보내기
    public void mailSend(EmailDto emailDto) {
        System.out.println("전송 완료!");
        
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(emailDto.getAddress());
        message.setSubject(emailDto.getTitle());
        message.setText(emailDto.getMessage());
        message.setFrom(EmailService.FROM_ADDRESS);
        message.setReplyTo(EmailService.FROM_ADDRESS);
        
        System.out.println("message"+message);
        mailSender.send(message);
    }
        
}