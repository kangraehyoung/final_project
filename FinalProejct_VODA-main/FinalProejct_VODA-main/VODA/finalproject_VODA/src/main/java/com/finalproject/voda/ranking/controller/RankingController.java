package com.finalproject.voda.ranking.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.ranking.model.service.RankingService;


@Controller
@RequestMapping("/ranking")
public class RankingController {
	@Autowired
	private RankingService service;
	
	@GetMapping("/ranking")
	public ModelAndView ranking(ModelAndView model,
							@RequestParam(value="type", defaultValue="영화") String type) {
		
		System.out.println(type);
		
		List<Contents> rankingTotalList = new ArrayList<Contents>();
		List<Contents> ranking1020WList = new ArrayList<Contents>();
		List<Contents> ranking1020MList = new ArrayList<Contents>();
		List<Contents> ranking3040WList = new ArrayList<Contents>();
		List<Contents> ranking3040MList = new ArrayList<Contents>();
		List<Contents> ranking50WList = new ArrayList<Contents>();
		List<Contents> ranking50MList = new ArrayList<Contents>();
		
		rankingTotalList = service.getTotalRanking(type);
		ranking1020WList = service.get1020WRanking(type);
		ranking1020MList = service.get1020MRanking(type);
		ranking3040WList = service.get3040WRanking(type);
		ranking3040MList = service.get3040MRanking(type);
		ranking50WList = service.get50WRanking(type);
		ranking50MList = service.get50MRanking(type);
		
		if(rankingTotalList.size()>10)
			rankingTotalList = rankingTotalList.subList(0, 10);
		if(ranking1020WList.size()>10)
			ranking1020WList = ranking1020WList.subList(0, 10);
		if(ranking1020MList.size()>10)
			ranking1020MList = ranking1020MList.subList(0, 10);
		if(ranking3040WList.size()>10)
			ranking3040WList = ranking3040WList.subList(0, 10);
		if(ranking3040MList.size()>10)
			ranking3040MList = ranking3040MList.subList(0, 10);
		if(ranking50WList.size()>10)
			ranking50WList = ranking50WList.subList(0, 10);
		if(ranking50MList.size()>10)
			ranking50MList = ranking50MList.subList(0, 10);
		
		model.addObject("type", type);
		model.addObject("rankingTotalList", rankingTotalList);
		model.addObject("ranking1020WList", ranking1020WList);
		model.addObject("ranking1020MList", ranking1020MList);
		model.addObject("ranking3040WList", ranking3040WList);
		model.addObject("ranking3040MList", ranking3040MList);
		model.addObject("ranking50WList", ranking50WList);
		model.addObject("ranking50MList", ranking50MList);
		model.setViewName("ranking/ranking");
		
		return model;
	}
}
