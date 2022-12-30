package com.finalproject.voda.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class JoinMember {

	private int joinNo;

	private Date joinDate;
	
	private int joinCount;
}
