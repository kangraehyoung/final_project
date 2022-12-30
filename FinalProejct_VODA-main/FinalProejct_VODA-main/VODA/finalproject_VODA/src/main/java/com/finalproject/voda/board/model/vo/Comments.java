package com.finalproject.voda.board.model.vo;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comments {

	int cmno;
	
	int bno;
	
	int cmwriterno;
	
	String cmcontent;
	
	String cmdate;
	
	String cmwriterid;
	
	String cmstatus;
	
}
