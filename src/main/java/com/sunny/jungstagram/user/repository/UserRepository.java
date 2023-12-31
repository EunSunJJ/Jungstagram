package com.sunny.jungstagram.user.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	
	// 아이디 찾기
	public Optional<User> findByEmailAndName(String email, String name);
	
	// 비밀번호 재설정
	public int countByEmailAndName (String email, String name);
	
	// 로그인 아이디 중복 = 조회된 갯수를 알아내면 된다
	// count로 쿼리를 만들어준다
	// SELECT count(1) ... WHERE `loginId` = #{loginId};
	public int countByLoginId(String loginId);
	
	// 로그인 
	// WHERE `loginId` = ?? AND `password` = ??;
	public Optional<User> findByLoginIdAndPassword(String loginId, String password);
	
}