package com.finalproject.voda.contents.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SearchPeople {
 	private int people_no;
 	private String people_name;
	private String people_original_filename;
	private String people_renamed_filename;
}

