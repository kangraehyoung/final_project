package com.finalproject.voda.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.mypage.model.mapper.MypageMapper;
import com.finalproject.voda.order.model.vo.Order;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	private MypageMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Override
	public List<Contents> getLikesAllList(int mNo) {
		
		return mapper.selectLikesAllList(mNo);
	}
	
	@Override
	public int getLikesCount(int m_no, String type) {
		// TODO Auto-generated method stub
		return mapper.selectLikesCount(m_no, type);
	}

	
	@Override
	public List<Contents> getLikesList(PageInfo pageInfo, int m_no, String type) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectLikesList(rowBounds, m_no, type);
	}

	@Override
	public int getReviewAllCount(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectReviewAllCount(m_no);
	}
	
	@Override
	public int getReviewCount(int m_no, String type) {
		// TODO Auto-generated method stub
		return mapper.selectReviewCount(m_no, type);
	}
	
	@Override
	public List<Contents> getReviewList(PageInfo pageInfo, int m_no, String type) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectReviewList(rowBounds, m_no, type);
	}
	
	@Override
	public int getFreeBoardCount(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectFreeBoardCount(m_no);
	}
	
	@Override
	public List<Board> getfreeBoardList(PageInfo pageInfo, int mNo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectFreeBoardList(rowBounds, mNo);
	}

	@Override
	public int getQnaBoardCount(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectQnaBoardCount(m_no);
	}
	
	@Override
	public List<Board> getqnaBoardList(PageInfo pageInfo, int mNo) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectQnaBoardList(rowBounds, mNo);
	}

	@Override
	public void pwdCheck(String m_password, String string) {
		// TODO Auto-generated method stub
		System.out.println(m_password);
		System.out.println(string);
		System.out.println(passwordEncoder.encode(string));
	}

	@Override
	@Transactional
	public int updateMember(Member member) {
		int result = 0;
		result = mapper.updateMember(member);
		return result;
	}

	@Override
	@Transactional
	public int deleteMember(int m_no) {
		int result = 0;
		
		result = mapper.deleteMember(m_no);
		
		return result;
	}

	@Override
	public int getFreeBoardSearchCount(int m_no, String searchType, String searchVal) {
		// TODO Auto-generated method stub
		return mapper.selectFreeBoardSearchCount(m_no, searchType, searchVal);
	}

	@Override
	public List<Board> getfreeBoardSearchList(PageInfo pageInfo, int m_no, String searchType, String searchVal) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectFreeBoardSearchList(rowBounds, m_no, searchType, searchVal);
	}

	@Override
	public int getQnaBoardSearchCount(int m_no, String searchType, String searchVal) {
		// TODO Auto-generated method stub
		return mapper.selectQnaBoardSearchCount(m_no, searchType, searchVal);
	}

	@Override
	public List<Board> getqnaBoardSearchList(PageInfo pageInfo, int m_no, String searchType, String searchVal) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectQnaBoardSearchList(rowBounds, m_no, searchType, searchVal);
	}

	@Override
	public int getLikesSearchCount(int m_no, String type, String searchType, String searchVal) {
		// TODO Auto-generated method stub
		return mapper.selectLikesSearchCount(m_no, type, searchType, searchVal);
	}

	@Override
	public List<Contents> getLikesSearchList(PageInfo pageInfo, int m_no, String type, String searchType,
			String searchVal) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectLikesSearchList(rowBounds, m_no, type, searchType, searchVal);
	}

	@Override
	public int getReviewSearchCount(int m_no, String type, String searchType, String searchVal) {
		// TODO Auto-generated method stub
		return mapper.selectReviewSearchCount(m_no, type, searchType, searchVal);
	}

	@Override
	public List<Contents> getReviewSearchList(PageInfo pageInfo, int m_no, String type, String searchType,
			String searchVal) {
		int offset = (pageInfo.getCurrentPage() -1)*pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return mapper.selectReviewSearchList(rowBounds, m_no, type, searchType, searchVal);
	}

	@Override
	@Transactional
	public int updateMemberPwd(int m_no, String password) {
		int result = 0;
		System.out.println(password);
		result = mapper.updateMemberPwd(m_no, password);
		return result;
	}

	@Override
	public int deleteDibsContent(int m_no, List<Integer> list) {
		// TODO Auto-generated method stub
		return mapper.deleteDibsContent(m_no, list);
	}

	@Override
	public List<Order> getOrderListByMNo(int m_no, String dateFrom, String dateTo) {
		// TODO Auto-generated method stub
		return mapper.selectOrderListByMNo(m_no, dateFrom, dateTo);
	}

	@Override
	public List<Order> getOrderCancelOrderListByMNo(int m_no, String dateFrom, String dateTo) {
		
		return mapper.selectCancelOrderListByMNo(m_no, dateFrom, dateTo);
	}
	
	@Override
	public Order getOrderByPayNo(int payNo) {
		// TODO Auto-generated method stub
		return mapper.selectOrderByPayNo(payNo);
	}

	@Override
	public int payCancel(int payNo) {
		// TODO Auto-generated method stub
		return mapper.payCancel(payNo);
	}

	@Override
	public List<Order> getAllOrderListByMNo(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectAllOrderListByMNo(m_no);
	}

	@Override
	public List<Order> getPayOrderList(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectPayOrderList(m_no);
	}

	@Override
	public List<Order> getCancelOrderList(int m_no) {
		// TODO Auto-generated method stub
		return mapper.selectCancelOrderList(m_no);
	}

	@Override
	public int refundCancel(int payNo) {
		// TODO Auto-generated method stub
		return mapper.refundCancel(payNo);
	}




}
