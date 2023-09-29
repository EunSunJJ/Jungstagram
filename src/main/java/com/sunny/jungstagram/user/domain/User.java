package com.sunny.jungstagram.user.domain;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.UpdateTimestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Table(name="user")
@Entity
public class User {
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Id
	private int id;
	
	@Column(name="loginId")
	private String loginId;
	private String email;
	private String name;
	private String nickname;
	private String password;
	private String introduction;
	private String gender;
	private String profilePath;
	
	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private Date createdAt;
	
	@UpdateTimestamp
	@Column(name="updatedAt")
	private Date updatedAt;
	

	public void setId(int id) {
		this.id = id;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public void setprofilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	
}
