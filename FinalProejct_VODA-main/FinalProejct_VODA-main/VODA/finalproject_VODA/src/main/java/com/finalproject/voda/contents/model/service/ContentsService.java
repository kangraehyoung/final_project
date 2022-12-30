package com.finalproject.voda.contents.model.service;

import java.util.List;
import java.util.Map;

import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.contents.model.vo.ContentsPeople;
import com.finalproject.voda.contents.model.vo.Likes;
import com.finalproject.voda.contents.model.vo.Rate;
import com.finalproject.voda.contents.model.vo.RateLikes;
import com.finalproject.voda.contents.model.vo.RateResult;
import com.finalproject.voda.contents.model.vo.SearchPeople;
import com.finalproject.voda.contents.model.vo.SearchResult;
import com.finalproject.voda.people.model.vo.People;

public interface ContentsService {
	
	int getContentsCount(String type);

	List<Contents> getContentsList(PageInfo pageInfo, String type, String sort);

	Contents findContentsByNo(int no, boolean hasRead);

	RateResult getContentsRateByNo(int no);

	List<ContentsPeople> getContentsPeopleByNo(int no);

	int save(Rate rate);

	List<Rate> getCommentsList(PageInfo pageInfo, int no, String sort);

	int getCommentsCount(int no);

	List<SearchResult> getContentsSearch(String keyword);

	Rate getMyRate(int rateNo);

	int delete(int rateNo);

	List<SearchPeople> getPeopleSearch(String keyword);

	int findLikes(Likes likes);

	void likeUp(int mNo, int cNo);

	void likeDown(int mNo, int cNo);

	List<RateLikes> findRateLikes(Map<String, Object> map);

	int likeCheck(Map<String, Object> map);

	void insertLike(Map<String, Object> map);

	void updateLike(int rate_no);

	void deleteLike(Map<String, Object> map);

	void updateLikeCancel(int rate_no);

	int likeCount(int rate_no);

	List<People> getPeopleList(PageInfo pageInfo);

	int getPeopleCount();
	
	int getPeopleSearchCount(String keyword);

	List<Search> getPeopleSearchList(PageInfo pageInfo, String keyword);

	int saveContents(Contents contents);

	void saveContentsPeople(ContentsPeople contentspeople);

	int findRate(Map<String, Object> map);

	List<Rate> orderByMyRate(Map<String, Object> mymap);

	Contents getBg(int no);

}
