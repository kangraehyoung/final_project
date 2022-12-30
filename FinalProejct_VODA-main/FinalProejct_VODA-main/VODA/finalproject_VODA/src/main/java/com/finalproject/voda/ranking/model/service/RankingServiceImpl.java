package com.finalproject.voda.ranking.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.ranking.model.mapper.RankingMapper;

@Service
public class RankingServiceImpl implements RankingService {
	@Autowired
	private RankingMapper mapper;

	@Override
	public List<Contents> getTotalRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.selectTotalRanking(type);
	}

	@Override
	public List<Contents> get1020WRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select1020WRanking(type);
	}

	@Override
	public List<Contents> get1020MRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select1020MRanking(type);
	}

	@Override
	public List<Contents> get3040WRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select3040WRanking(type);
	}

	@Override
	public List<Contents> get3040MRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select3040MRanking(type);
	}

	@Override
	public List<Contents> get50WRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select50WRanking(type);
	}

	@Override
	public List<Contents> get50MRanking(String type) {
		// TODO Auto-generated method stub
		return mapper.select50MRanking(type);
	}

}
