package com.sunny.jungstagram.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sunny.jungstagram.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer >{

	
}
