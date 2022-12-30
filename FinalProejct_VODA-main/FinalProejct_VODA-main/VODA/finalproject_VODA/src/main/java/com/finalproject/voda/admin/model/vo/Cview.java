package com.finalproject.voda.admin.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Cview {

	private int cviewno;

	private Date cviewdate;
	
	private int cviewcount;
	
}