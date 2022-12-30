package com.finalproject.voda.admin.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
	
	private int noticeno;

	private String noticeTitle;
	
	private int noticeWriterNo;
	
	private String noticeWriterId;
	
	private String noticeContent;
	
	private String noticeOriginalFileName;
	
	private String noticeRenamedFileName;
	
	private int noticeReadCount;
	
	private String noticeStatus;
	
	@DateTimeFormat(pattern = "yyyyMMdd")
	private Date noticeCreateDate;
	
	private String noticeTopTitle;
	
}
