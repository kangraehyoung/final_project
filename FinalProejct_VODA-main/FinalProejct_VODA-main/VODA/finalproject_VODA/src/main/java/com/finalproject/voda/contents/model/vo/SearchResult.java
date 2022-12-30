package com.finalproject.voda.contents.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchResult {
	private int c_no;
	private String c_title;
	private String c_type;
 	private String c_bimg;
 	private String c_obimg;
 	private String c_pimg;
 	private String c_opimg;
 	private String c_nation;
	private String c_synop;
 	private int c_year;
 	private int people_no;
 	private String people_name;
	private String people_original_filename;
	private String people_renamed_filename;
}

