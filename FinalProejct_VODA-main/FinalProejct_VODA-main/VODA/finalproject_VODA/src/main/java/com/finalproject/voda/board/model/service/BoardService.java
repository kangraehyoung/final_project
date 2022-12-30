package com.finalproject.voda.board.model.service;

import java.util.HashMap;
import java.util.List;

import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;

public interface BoardService {

	int getBoardCount(String type);

	List<Board> getBoardList(PageInfo pageInfo, String type);

	Board findBoardByNo(int no, boolean hasRead);

	int deleteFree(int no);

	int saveBoard(Board board);
	
	int getBoardSearchCount(String searchType, String keyword);
	List<Search> getBoardSearchList(PageInfo pageInfo, String searchType, String keyword);

	int getQnaSearchCount(String searchType, String keyword);
	List<Search> getQnaSearchList(PageInfo pageInfo, String searchType, String keyword);
	
	// 댓글 작성
	int commentswrite(HashMap<String, Object> comments);
	
	// 댓글 답변여부
	int answerstatus(HashMap<String, Object> comments);
	
	// 댓글 답변삭제
	int answerdelete(HashMap<String, Object> comments);
	
	// 댓글 삭제
	int commentsdelete(HashMap<String, Object> comments);
	
	// 댓글 수정
	int commentsupdate(HashMap<String, Object> comments);
	
	// 댓글 수정(시간)
	int updatetime(HashMap<String, Object> comments);
	
	// 일반회원용 공지사항 페이지
	int getNoticeCount();
	List<Notice> getNoticeList(PageInfo pageInfo);
	int getNoticeSearchCount(String searchType, String keyword);
	List<Search> getNoticeSearchList(PageInfo pageInfo, String searchType, String keyword);
	Notice findNoticeByNo(int no, boolean hasRead);










}
