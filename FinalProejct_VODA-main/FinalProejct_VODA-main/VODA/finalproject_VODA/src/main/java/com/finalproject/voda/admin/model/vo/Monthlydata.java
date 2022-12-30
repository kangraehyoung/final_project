package com.finalproject.voda.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Monthlydata {

	private String yeardata;

	private String monthdata;
	
	private int cviewdata;

	private int joinmemberdata;
	
	private int salesdata;
	
}