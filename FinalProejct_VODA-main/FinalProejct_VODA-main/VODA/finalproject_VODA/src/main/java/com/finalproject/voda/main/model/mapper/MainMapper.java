package com.finalproject.voda.main.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.finalproject.voda.contents.model.vo.Contents;

@Mapper
public interface MainMapper {

	List<Contents> getContentsRankList();

}
