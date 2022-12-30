package com.finalproject.voda.member.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	private int m_no;
	
	private String m_id;
	
	private String m_password;
	
	private String m_name;

	private String m_email;

	private String m_phone;

	private String m_address;
	
	private String m_gender;

	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date m_birth;

	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date m_joinDate;

	private String m_authorization;

	private String m_status;
	
	private String m_joinWay;
	
	private int m_postNum;
	
	private String m_detailAddress;

	
}