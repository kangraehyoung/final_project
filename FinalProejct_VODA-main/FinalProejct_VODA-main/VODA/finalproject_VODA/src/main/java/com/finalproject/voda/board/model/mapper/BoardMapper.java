package com.finalproject.voda.board.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.Search;

@Mapper
public interface BoardMapper {
	int selectBoardCount(String type);

	List<Board> selectAllBoard(RowBounds rowBounds, String type);

	Board selectBoardByNo(int no);
	
	int updateBoardView(Board board);

	int updateBoardStatus(@Param("bno")int no, @Param("bstatus") String string);

	int updateBoard(Board board);

	int insertBoard(Board board);
	
	
	// 댓글 작성
	int commentswrite(HashMap<String, Object> comments);
	
	// 댓글 삭제
	int commentsdelete(HashMap<String, Object> comments);
	
	// 댓글 수정
	int commentsupdate(HashMap<String, Object> comments);
	
	// 댓글 수정(시간)
	int updatetime(HashMap<String, Object> comments);
	
	// 댓글 답변여부
	int answerstatus(int bno);
	
	// 댓글 답변삭제
	int answerdelete(int bno);
	
	// 자유게시판검색
	int getBoardSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getBoardSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);

	// 문의게시판검색
	int getQnaSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getQnaSearchList(RowBounds rowBounds, @Param("searchType") String searchType,  @Param("keyword") String keyword);
	
	
	// 일반회원용 공지사항 페이지
	int selectNoticeCount();
	List<Notice> selectAllNotice(RowBounds rowBounds);
	Notice selectNoticeByNo(int no);
	int getNoticeSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getNoticeSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateNoticeView(Notice notice);










}
