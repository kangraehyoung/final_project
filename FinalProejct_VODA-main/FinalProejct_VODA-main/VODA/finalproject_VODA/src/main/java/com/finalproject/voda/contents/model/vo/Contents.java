package com.finalproject.voda.contents.model.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Contents {
	private int c_no;
	private String c_title;
	private String c_type;
    private String c_genre;
	private	int c_year;
	private String c_nation;
	private int c_age;
	private	String c_info;
	private String c_synop;
	private String c_obimg;
	private String c_bimg;
	private	String c_opimg;
	private String c_pimg;
	private String c_video;
	private Date c_date;
	private String c_status;
	private double rate_star;
	private List<Rate> rates;
	private String c_leftcolor;
	private String c_rightcolor;
}
