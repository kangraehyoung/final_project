package com.finalproject.voda.admin.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.AbstractDocument.Content;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.voda.admin.model.mapper.AdminMapper;
import com.finalproject.voda.admin.model.vo.ContentsType;
import com.finalproject.voda.admin.model.vo.Cview;
import com.finalproject.voda.admin.model.vo.JoinMember;
import com.finalproject.voda.admin.model.vo.Monthlydata;
import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.admin.model.vo.Sales;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.product.model.vo.Product;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	AdminMapper mapper;
	
	// 대시보드 데이터 호출 (ContentsType, JoinMember, Cview, Sales)
	@Override
	public ContentsType getDashboardContentstypeData() {		
		return mapper.selectDashboardContentstypeData();
	}
	@Override
	public JoinMember getDashboardJoinmemberData() {		
		return mapper.selectDashboardJoinmemberData();
	}
	@Override
	public Cview getDashboardCviewData() {	
		return mapper.selectDashboardCviewData();
	}
	@Override
	public Sales getDashboardSalesData() {
		return mapper.selectDashboardSalesData();
	}
	@Override
	public List<Monthlydata> getDashboardMonthlydataData() {
		return mapper.selectDashboardMonthlydataData();
	}

	
	
	// 회원관리 전체개수 카운트
	@Override
	public int getMemberCount() {
	
		return mapper.selectMemberCount();
	}

	// 회원관리 리스트 조회
	@Override
	public List<Member> getMemberList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllMember(rowBounds);	
	}
	// 회원관리 검색 조회 (총개수)
	@Override
	public int getMemberSearchCount(String searchType, String keyword) {
		return mapper.getMemberSearchCount(searchType, keyword);
	}
	// 회원관리 검색 조회 (리스트)
	@Override
	public List<Search> getMemberSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getMemberSearchList(rowBounds, searchType, keyword);
	}

	
	// 회원 비활성화
	@Override
	public int deleteMember(int mno, String memberStatus) {
		int result = 0;
		
		result =  mapper.updateMemberStatus(mno, memberStatus);
		return result;
	}

	// 컨텐츠 전체개수 카운트
	@Override
	public int getContentCount() {
		return mapper.selectContentCount();
	}
	
	// 컨텐츠 리스트 조회
	@Override
	public List<Content> getContentList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllContent(rowBounds);	
	}
	
	// 컨텐츠 리스트 검색 (총개수)
	@Override
	public int getContentSearchCount(String searchType, String keyword) {
		return mapper.getContentSearchCount(searchType, keyword);
	}
	
	// 컨텐츠 리스트 검색 (리스트)
	@Override
	public List<Search> getContentSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getContentSearchList(rowBounds, searchType, keyword);
	}
	
	// 컨텐츠 비활성화
	@Override
	public int deleteContent(int cno, String contentStatus) {
		int result = 0;
		
		result =  mapper.updateContentStatus(cno, contentStatus);
		return result;
	}
	
	// 상품 전체개수 카운트
	@Override
	public int getProductCount() {
		return mapper.selectProductCount();
	}
	
	// 상품 리스트 조회
	@Override
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllProduct(rowBounds);	
	}
	
	// 상품 리스트 검색 (총개수)
	@Override
	public int getGoodsSearchCount(String searchType, String keyword) {
		return mapper.getGoodsSearchCount(searchType, keyword);
	}
	
	// 상품 리스트 검색 (리스트)
	@Override
	public List<Search> getGoodsSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getGoodsSearchList(rowBounds, searchType, keyword);
	}
	
	// 상품 비활성화
	@Override
	public int deleteGoods(int pno, String pstatus) {
		int result = 0;
		
		result =  mapper.updateGoodsStatus(pno, pstatus);
		return result;
	}
	
	// 상품주문 전체개수 카운트
	@Override
	public int getOrderCount() {
		return mapper.selectOrderCount();
	}
	// 상품주문 리스트 조회
	@Override
	public List<Product> getOrderList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllOrder(rowBounds);	
	}
	// 상품주문 검색 카운트
	@Override
	public int getOrderSearchCount(String searchType, String keyword) {
		return mapper.getOrderSearchCount(searchType, keyword);
	}
	// 상품주문 검색 리스트 
	@Override
	public List<Search> getOrderSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getOrderSearchList(rowBounds, searchType, keyword);
	}
	// 상품주문 환불 처리 
	@Override
	public int refundGoods(int no) {
		int result = 0;
		
		result =  mapper.updateOrderStatus(no);
		return result;
	}


	// 자유게시판 전체개수 카운트
	@Override
	public int getBoardCount() {
		return mapper.selectBoardCount();
	}

	// 자유게시판 리스트 조회
	@Override
	public List<Board> getBoardList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectAllBoard(rowBounds);	
	}
	
	// 자유게시판 검색 (총개수)
	@Override
	public int getFreeboardSearchCount(String searchType, String keyword) {
		return mapper.getFreeboardSearchCount(searchType, keyword);
	}
	
	// 자유게시판 검색 (리스트)
	@Override
	public List<Search> getFreeboardSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getFreeboardSearchList(rowBounds, searchType, keyword);
	}
	
	// 자유게시판 비활성화
	@Override
	public int deleteboard(int bno, String bstatus) {
		int result = 0;
		
		result =  mapper.updateFreeboardStatus(bno, bstatus,"FREE");
		result =  mapper.updateQnaStatus(bno, bstatus,"QNA");
		return result;
	}
	
	// 문의게시판 전체개수 카운트
	@Override
	public int getQnaCount() {
		return mapper.selectQnaCount();
	}
	
	// 문의게시판 리스트 조회
	@Override
	public List<Board> getQnaList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectAllQna(rowBounds);	
	}
	
	// 문의게시판 검색 (총개수)
	@Override
	public int getQnaSearchCount(String searchType, String keyword) {
		return mapper.getQnaSearchCount(searchType, keyword);
	}
	// 문의게시판 검색 (리스트)
	@Override
	public List<Search> getQnaSearchList(PageInfo pageInfo, String searchType, String keyword) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.getQnaSearchList(rowBounds, searchType, keyword);
	}
	
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

	// 공지사항 등록
	@Transactional
	@Override
	public int saveNotice(Notice notice) {
		int result = 0;
		
		if(notice.getNoticeno() != 0) {
			// update
			result = mapper.updateNotice(notice);
		} else {
			// insert
			result = mapper.insertNotice(notice);
		}
		
		return result;
	}

	// 공지사항 삭제
	@Override
	public int deleteNotice(int no) {
		int result = 0;
		
		result = mapper.updateNoticeStatus(no, "N");
		
		return result;
	}
	
	// 통계페이지 (조회수)
	@Override
	public int getTotalviewCount() {
		return mapper.selectTotalviewCount();
	}
	// 통계페이지 조회수 리스트
	@Override
	public List<Cview> getTotalviewList(PageInfo pageInfo, String no) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectTotalviewList(rowBounds, no);	
	}
	// 통계페이지 (매출액)
	@Override
	public int getTotalsalesCount() {
		return mapper.selectTotalsalesCount();
	}
	// 통계페이지 매출액 리스트
	@Override
	public List<Sales> getTotalsalesList(PageInfo pageInfo, String no) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectTotalsalesList(rowBounds, no);	
	}
	// 통계페이지 (가입자수)	
	@Override
	public int getTotaljoinCount() {
		return mapper.selectTotaljoinCount();
	}
	// 통계페이지 가입자수 리스트
	@Override
	public List<JoinMember> getTotaljoinList(PageInfo pageInfo, String no) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return mapper.selectTotaljoinList(rowBounds, no);	
	}



}
