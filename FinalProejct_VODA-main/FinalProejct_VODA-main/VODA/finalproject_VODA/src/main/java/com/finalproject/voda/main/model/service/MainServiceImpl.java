package com.finalproject.voda.main.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.main.model.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainMapper mapper;
	
	@Override
	public List<Contents> getContentsRankList() {
		
		return mapper.getContentsRankList();
	}

}
