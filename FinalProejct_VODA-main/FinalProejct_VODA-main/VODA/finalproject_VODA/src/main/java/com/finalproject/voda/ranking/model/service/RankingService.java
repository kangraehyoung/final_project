package com.finalproject.voda.ranking.model.service;

import java.util.List;

import com.finalproject.voda.contents.model.vo.Contents;

public interface RankingService {

	List<Contents> getTotalRanking(String type);

	List<Contents> get1020WRanking(String type);

	List<Contents> get1020MRanking(String type);

	List<Contents> get3040WRanking(String type);

	List<Contents> get3040MRanking(String type);

	List<Contents> get50WRanking(String type);

	List<Contents> get50MRanking(String type);

}
