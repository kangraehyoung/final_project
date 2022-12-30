package com.finalproject.voda.order.model.vo;

import java.util.Date;
import java.util.List;

import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.product.model.vo.Product;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Order {
	private int pno;
	
	private int payno;
	
	private int mno;
	
	private Date odate;
	
	private int oqtt;
	
	private String oadress;
	
	private String pname;
	
	private String pcategory;
	
	private String pmadecompany;
	
	private String omessage;
	
	private List<Product> productList;
	
	private Pay pay;
	
	private String oname;
	
	private String ophone;
	
	private int opostnum;
	
	private String oadressdetail;
	
	private List<Member> member;
	
	
}
