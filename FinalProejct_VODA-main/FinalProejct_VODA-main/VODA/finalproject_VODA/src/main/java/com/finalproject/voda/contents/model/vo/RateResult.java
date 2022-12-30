package com.finalproject.voda.contents.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class RateResult {
	private int rate_count;
	private int _05;
	private int _1;
	private int _15;
	private int _2;
	private int _25;
	private int _3;
	private int _35;
	private int _4;
	private int _45;
	private int _5;
	private double rate_avg;
}
