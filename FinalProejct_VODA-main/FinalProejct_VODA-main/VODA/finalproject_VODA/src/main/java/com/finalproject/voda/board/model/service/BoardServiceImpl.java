package com.finalproject.voda.board.model.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.board.model.mapper.BoardMapper;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper mapper;
	
	@Override
	public int getBoardCount(String type) {
		
		return mapper.selectBoardCount(type);
	}

	// 자유게시판 리스트 조회
	@Override
	public List<Board> getBoardList(PageInfo pageInfo, String type) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllBoard(rowBounds, type);
	}
	
	// 자유게시판 검색 조회 (총개수)
	@Override
	public int getBoardSearchCount(String searchType, String keyword) {
		
		return mapper.getBoardSearchCount(searchType, keyword);
	}

	// 자유게시판 검색 조회 (리스트)
	@Override
	public List<Search> getBoardSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getBoardSearchList(rowBounds, searchType, keyword);
	}
	
	// 문의게시판 검색 조회 (총개수)
	@Override
	public int getQnaSearchCount(String searchType, String keyword) {
		
		return mapper.getQnaSearchCount(searchType, keyword);
	}

	// 문의게시판 검색 조회 (리스트)
	@Override
	public List<Search> getQnaSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getQnaSearchList(rowBounds, searchType, keyword);
	}
	
	
	// 자유게시판 상세 조회
	@Override
	public Board findBoardByNo(int no, boolean hasRead) {
		Board board = null;
		
		board = mapper.selectBoardByNo(no);
		
		if(board != null && !hasRead) {
			mapper.updateBoardView(board);
		}

		return mapper.selectBoardByNo(no);
	}

	// 자유게시판 삭제
	@Override
	public int deleteFree(int no) {
		int result = 0;
		
		result = mapper.updateBoardStatus(no, "N");
		
		return result;
	}

	// 자유게시판 등록	
	@Transactional
	@Override
	public int saveBoard(Board board) {
		int result = 0;
		
		System.out.println("보드넘버" + board.getBno());
		
		if(board.getBno() != 0) {
			// update
			result = mapper.updateBoard(board);
		} else {
			// insert
			result = mapper.insertBoard(board);
		}
		
		return result;
	}

	
	
	// 일반회원용 공지사항 페이지
	// 공지사항 전체개수 카운트
	@Override
	public int getNoticeCount() {
		return mapper.selectNoticeCount();
	}
	
	// 공지사항 리스트 조회
	@Override
	public List<Notice> getNoticeList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllNotice(rowBounds);	
		}
	
	// 공지사항 검색 조회 (총개수)
	@Override
	public int getNoticeSearchCount(String searchType, String keyword) {
		
		return mapper.getNoticeSearchCount(searchType, keyword);
	}

	// 공지사항 검색 조회 (리스트)
	@Override
	public List<Search> getNoticeSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getNoticeSearchList(rowBounds, searchType, keyword);
	}

	// 공지사항 상세 조회
	@Transactional
	@Override
	public Notice findNoticeByNo(int no, boolean hasRead) {
		Notice notice = null;
		
		notice = mapper.selectNoticeByNo(no);
		
		if(notice != null && !hasRead) {
			mapper.updateNoticeView(notice);
		}
		
		return mapper.selectNoticeByNo(no);
	}

	
	// 댓글 작성
	
	@Override
	public int commentswrite(HashMap<String, Object> comments) {
		
		System.out.println("댓글 추가 : " + comments);
		
		return mapper.commentswrite(comments);
		
	}

	// 댓글 삭제
	@Override
	public int commentsdelete(HashMap<String, Object> comments) {
		
		System.out.println("댓글 삭제 : " + comments);
		
		return mapper.commentsdelete(comments);
	}

	// 댓글 수정
	@Override
	public int commentsupdate(HashMap<String, Object> comments) {
		
		System.out.println("댓글 수정 : " + comments);
		
		return mapper.commentsupdate(comments);
	}

	// 댓글 수정(시간)
	@Override
	public int updatetime(HashMap<String, Object> comments) {
		System.out.println("댓글 시간 : " + comments);
		
		return mapper.updatetime(comments);
	}

	
	
	// 댓글 답변여부
	@Override
	public int answerstatus(HashMap<String, Object> comments) {
		
		int bno = (int)(comments.get("bno"));
		
		System.out.println(bno);
		
		return mapper.answerstatus(bno);
	}

	@Override
	public int answerdelete(HashMap<String, Object> comments) {
		
		int bno = (int)(comments.get("bno"));
		
		System.out.println(bno);
		
		return mapper.answerdelete(bno);
	}


}
