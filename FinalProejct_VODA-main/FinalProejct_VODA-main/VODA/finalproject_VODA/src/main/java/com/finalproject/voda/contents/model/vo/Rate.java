package com.finalproject.voda.contents.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rate {	
	private int rate_no;
	private int c_no; // 컨텐츠 번호
	private int m_no; // 멤버 번호
	private String m_id; // 멤버 아이디
	private double rate_star;
	private String rate_comment;
	private Date rate_date;
	private int rate_like;
}
