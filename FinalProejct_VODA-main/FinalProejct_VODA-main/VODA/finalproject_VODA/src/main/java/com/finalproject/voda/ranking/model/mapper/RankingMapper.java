package com.finalproject.voda.ranking.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalproject.voda.contents.model.vo.Contents;

public interface RankingMapper {

	List<Contents> selectTotalRanking(String type);

	List<Contents> select1020WRanking(String type);

	List<Contents> select1020MRanking(String type);

	List<Contents> select3040WRanking(String type);

	List<Contents> select3040MRanking(String type);

	List<Contents> select50WRanking(String type);

	List<Contents> select50MRanking(String type);

}
