package com.finalproject.voda.product.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	private int pno;
	
	private String pname;
	
	private int pprice;
	
	private int pqtt;
	
	private String pcontents;
	
	private int pview;
	
	private Date pdate;
	
	private String pstatus;
	
	private String poriginfile;
	
	private String prenamefile;
	
	private String pcategory;
	
	private String pmadelocal;
	
	private String pmadecompany;
	
	private String searchname;
	
	private String searchtype;
	
	private int porderqtt;
}
