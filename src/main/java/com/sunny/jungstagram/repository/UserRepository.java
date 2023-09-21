package com.sunny.jungstagram.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>{

	// 로그인 아이디 중복 = 조회된 갯수를 알아내면 된다
	// count로 쿼리를 만들어준다
	public int countByLoginId(String loginId);
	
}
