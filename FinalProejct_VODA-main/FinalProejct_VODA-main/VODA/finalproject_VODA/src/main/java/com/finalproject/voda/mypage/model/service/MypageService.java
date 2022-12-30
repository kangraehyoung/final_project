package com.finalproject.voda.mypage.model.service;

import java.util.List;

import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.order.model.vo.Order;

public interface MypageService {

	List<Contents> getLikesAllList(int mNo);

	int getLikesCount(int m_no, String type);
	
	List<Contents> getLikesList(PageInfo pageInfo, int m_no, String type);

	int getReviewCount(int m_no, String type);
	
	List<Contents> getReviewList(PageInfo pageInfo, int m_no, String type);
	
	int getFreeBoardCount(int m_no);
	
	List<Board> getfreeBoardList(PageInfo pageInfo, int mNo);
	
	int getQnaBoardCount(int m_no);
	
	List<Board> getqnaBoardList(PageInfo pageInfo, int mNo);

	void pwdCheck(String m_password, String string);

	int updateMember(Member member);

	int deleteMember(int m_no);

	int getFreeBoardSearchCount(int m_no, String searchType, String searchVal);

	List<Board> getfreeBoardSearchList(PageInfo pageInfo, int m_no, String searchType, String searchVal);

	int getQnaBoardSearchCount(int m_no, String searchType, String searchVal);

	List<Board> getqnaBoardSearchList(PageInfo pageInfo, int m_no, String searchType, String searchVal);

	int getLikesSearchCount(int m_no, String type, String searchType, String searchVal);

	List<Contents> getLikesSearchList(PageInfo pageInfo, int m_no, String type, String searchType, String searchVal);

	int getReviewSearchCount(int m_no, String type, String searchType, String searchVal);

	List<Contents> getReviewSearchList(PageInfo pageInfo, int m_no, String type, String searchType, String searchVal);

	int updateMemberPwd(int m_no, String password);

	int deleteDibsContent(int m_no, List<Integer> list);

	List<Order> getOrderListByMNo(int m_no, String dateFrom, String dateTo);

	Order getOrderByPayNo(int payNo);

	int getReviewAllCount(int m_no);

	List<Order> getOrderCancelOrderListByMNo(int m_no, String dateFrom, String dateTo);

	int payCancel(int payNo);

	List<Order> getAllOrderListByMNo(int m_no);

	List<Order> getPayOrderList(int m_no);

	List<Order> getCancelOrderList(int m_no);

	int refundCancel(int payNo);


}
