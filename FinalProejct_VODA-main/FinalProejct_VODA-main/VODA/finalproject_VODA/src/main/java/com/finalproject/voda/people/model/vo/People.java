package com.finalproject.voda.people.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class People {
	private int people_no;
	
	private String people_original_filename;
	
	private String people_renamed_filename;
	
	private String people_name;
	
	private String people_job;
	
	private String people_debut; 
	
	private String people_birth;
	
	private String poeple_award;
	
	private String people_gender;
	
	private String people_status;
}
