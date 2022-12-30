package com.finalproject.voda.admin.model.service;

import java.util.List;

import javax.swing.text.AbstractDocument.Content;

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

public interface AdminService {

	ContentsType getDashboardContentstypeData();
	JoinMember getDashboardJoinmemberData();
	Cview getDashboardCviewData();
	Sales getDashboardSalesData();
	List<Monthlydata> getDashboardMonthlydataData();

	int getMemberCount();
	List<Member> getMemberList(PageInfo pageInfo);
	int getMemberSearchCount(String searchType, String keyword);
	List<Search> getMemberSearchList(PageInfo pageInfo, String searchType, String keyword);
	int deleteMember(int mno, String memberStatus);


	int getContentCount();
	List<Content> getContentList(PageInfo pageInfo);
	int getContentSearchCount(String searchType, String keyword);
	List<Search> getContentSearchList(PageInfo pageInfo, String searchType, String keyword);	
	int deleteContent(int cno, String contentStatus);

	int getProductCount();
	List<Product> getProductList(PageInfo pageInfo);
	int getGoodsSearchCount(String searchType, String keyword);
	List<Search> getGoodsSearchList(PageInfo pageInfo, String searchType, String keyword);
	int deleteGoods(int pno, String pstatus);

	int getOrderCount();
	List<Product> getOrderList(PageInfo pageInfo);
	int getOrderSearchCount(String searchType, String keyword);
	List<Search> getOrderSearchList(PageInfo pageInfo, String searchType, String keyword);
	int refundGoods(int no);
	
	int getBoardCount();
	List<Board> getBoardList(PageInfo pageInfo);
	int getFreeboardSearchCount(String searchType, String keyword);
	List<Search> getFreeboardSearchList(PageInfo pageInfo, String searchType, String keyword);
	int deleteboard(int bno, String bstatus);
	
	int getQnaCount();
	List<Board> getQnaList(PageInfo pageInfo);
	int getQnaSearchCount(String searchType, String keyword);
	List<Search> getQnaSearchList(PageInfo pageInfo, String searchType, String keyword);


	int getNoticeCount();
	List<Notice> getNoticeList(PageInfo pageInfo);
	int getNoticeSearchCount(String searchType, String keyword);
	List<Search> getNoticeSearchList(PageInfo pageInfo, String searchType, String keyword);
	Notice findNoticeByNo(int no, boolean hasRead);
	int saveNotice(Notice notice);
	int deleteNotice(int no);
	
	int getTotalviewCount();
	List<Cview> getTotalviewList(PageInfo pageInfo, String no);
	int getTotalsalesCount();
	List<Sales> getTotalsalesList(PageInfo pageInfo, String no);
	int getTotaljoinCount();
	List<JoinMember> getTotaljoinList(PageInfo pageInfo, String no);













}
