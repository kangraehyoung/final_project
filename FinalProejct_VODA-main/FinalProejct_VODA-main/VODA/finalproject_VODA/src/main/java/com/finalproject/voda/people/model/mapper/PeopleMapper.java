package com.finalproject.voda.people.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.people.model.vo.People;

@Mapper
public interface PeopleMapper {

	int selectPeopleCount();

	List<People> selectPeopleAll(RowBounds rowBounds);

	People selectPeopleByNo(int people_no);

	int insertPeople(People people);

	int updatePeople(People people);

	int deletePeople(@Param("list")List<Integer> list, @Param("people_status") String string);

	int getPeopleSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);

	List<Search> getPeopleSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);

}
