package com.finalproject.voda.admin.model.mapper;

import java.util.List;

import javax.swing.text.AbstractDocument.Content;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.voda.admin.model.vo.ContentsType;
import com.finalproject.voda.admin.model.vo.Cview;
import com.finalproject.voda.admin.model.vo.JoinMember;
import com.finalproject.voda.admin.model.vo.Monthlydata;
import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.admin.model.vo.Sales;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.product.model.vo.Product;

@Mapper
public interface AdminMapper {
	
	ContentsType selectDashboardContentstypeData();
	JoinMember selectDashboardJoinmemberData();
	Cview selectDashboardCviewData();
	Sales selectDashboardSalesData();
	List<Monthlydata> selectDashboardMonthlydataData();
	
	int selectViewCount();

	int selectMemberCount();
	List<Member> selectAllMember(RowBounds rowBounds);
	int getMemberSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getMemberSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateMemberStatus(@Param("mno") int mno, @Param("memberStatus") String memberStatus);

	int selectContentCount();
	List<Content> selectAllContent(RowBounds rowBounds);
	int getContentSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getContentSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateContentStatus(@Param("cno") int cno, @Param("contentStatus") String contentStatus);

	int selectProductCount();
	List<Product> selectAllProduct(RowBounds rowBounds);
	int getGoodsSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getGoodsSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateGoodsStatus(@Param("pno") int pno, @Param("pstatus") String pstatus);

	int selectOrderCount();
	List<Product> selectAllOrder(RowBounds rowBounds);
	int getOrderSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getOrderSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateOrderStatus(@Param("no") int no);
	
	int selectBoardCount();
	List<Board> selectAllBoard(RowBounds rowBounds);
	int getFreeboardSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getFreeboardSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateFreeboardStatus(@Param("bno") int bno, @Param("bstatus") String bstatus, @Param("btype") String btype);

	int selectQnaCount();
	List<Board> selectAllQna(RowBounds rowBounds);
	int getQnaSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getQnaSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	int updateQnaStatus(@Param("bno") int bno, @Param("bstatus") String bstatus, @Param("btype") String btype);
	
	int selectNoticeCount();
	List<Notice> selectAllNotice(RowBounds rowBounds);
	Notice selectNoticeByNo(int no);
	int updateNoticeView(Notice notice);
	
	// 공지사항검색
	int getNoticeSearchCount(@Param("searchType") String searchType, @Param("keyword") String keyword);
	List<Search> getNoticeSearchList(RowBounds rowBounds,@Param("searchType") String searchType, @Param("keyword") String keyword);
	
	int updateNotice(Notice notice);
	int insertNotice(Notice notice);
	int updateNoticeStatus(@Param("noticeno") int no, @Param("noticeStatus") String string);
	
	int selectTotalviewCount();
	List<Cview> selectTotalviewList(RowBounds rowBounds, @Param("no") String no);
	int selectTotalsalesCount();
	List<Sales> selectTotalsalesList(RowBounds rowBounds, String no);
	int selectTotaljoinCount();
	List<JoinMember> selectTotaljoinList(RowBounds rowBounds, String no);






}
