package com.sunny.jungstagram.email.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class EmailDto {
	
	private int id;
	private String email;
	private String name;
    private String address;
    private String title;
    private String message;
}
