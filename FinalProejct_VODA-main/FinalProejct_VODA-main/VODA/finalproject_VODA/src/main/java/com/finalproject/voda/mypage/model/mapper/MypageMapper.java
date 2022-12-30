package com.finalproject.voda.mypage.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.order.model.vo.Order;

public interface MypageMapper {
	
	int selectFreeBoardCount(int m_no);
	
	List<Board> selectFreeBoardList(RowBounds rowBounds, int mNo);

	int selectQnaBoardCount(int m_no);
	
	List<Board> selectQnaBoardList(RowBounds rowBounds, int mNo);

	List<Contents> selectdibsContentsList(int m_no, String type);

	int updateMember(Member member);

	int deleteMember(int m_no);

	int selectFreeBoardSearchCount(@Param("m_no") int m_no, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	List<Board> selectFreeBoardSearchList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	int selectQnaBoardSearchCount(@Param("m_no") int m_no, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	List<Board> selectQnaBoardSearchList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	List<Contents> selectLikesAllList(int mNo);

	List<Contents> selectLikesList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("type") String type);

	List<Contents> selectReviewList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("type") String type);

	int selectLikesCount(@Param("m_no") int m_no, @Param("type") String type);

	int selectReviewCount(@Param("m_no") int m_no,  @Param("type") String type);

	int selectLikesSearchCount(@Param("m_no") int m_no, @Param("type") String type, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	List<Contents> selectLikesSearchList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("type") String type, @Param("searchType") String searchType,
			@Param("searchVal") String searchVal);

	int selectReviewSearchCount(@Param("m_no") int m_no, @Param("type") String type, @Param("searchType") String searchType, @Param("searchVal") String searchVal);

	List<Contents> selectReviewSearchList(RowBounds rowBounds, @Param("m_no") int m_no, @Param("type") String type, @Param("searchType") String searchType,
			@Param("searchVal") String searchVal);

	int updateMemberPwd(@Param("m_no") int m_no, @Param("password") String password);

	int deleteDibsContent(@Param("m_no") int m_no, @Param("list") List<Integer> list);

	List<Order> selectOrderListByMNo(@Param("m_no")int m_no, @Param("dateFrom")String dateFrom, @Param("dateTo")String dateTo);

	List<Order> selectCancelOrderListByMNo(@Param("m_no")int m_no, @Param("dateFrom")String dateFrom, @Param("dateTo")String dateTo);
	
	Order selectOrderByPayNo(int payNo);

	int selectReviewAllCount(int m_no);

	int payCancel(int payNo);

	List<Order> selectAllOrderListByMNo(int m_no);

	List<Order> selectPayOrderList(int m_no);

	List<Order> selectCancelOrderList(int m_no);

	int refundCancel(int payNo);

}
