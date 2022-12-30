package com.finalproject.voda.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.contents.model.vo.Contents;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.mypage.model.service.MypageService;
import com.finalproject.voda.order.model.vo.Order;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MypageService service;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@GetMapping("/main")
	public ModelAndView main(ModelAndView model,
								@SessionAttribute("loginMember") Member loginMember) {
		
		List<Contents> likesList = null;
		int reviewCount = 0;
		List<Board> freeBoardList = null;
		List<Board> qnaBoardList = null;
		PageInfo pageInfo1 = null;
		PageInfo pageInfo2 = null;
		List<Order> orderList = new ArrayList<Order>();
		List<Order> payOrderList = new ArrayList<Order>();
		List<Order> cancelOrderList = new ArrayList<Order>();
		
		orderList = service.getAllOrderListByMNo(loginMember.getM_no());
		if(orderList.size() > 5) {
			orderList = orderList.subList(0, 5);
		}
		likesList = service.getLikesAllList(loginMember.getM_no());
		
		reviewCount = service.getReviewAllCount(loginMember.getM_no());
		
		pageInfo1 = new PageInfo(1, 10, service.getFreeBoardCount(loginMember.getM_no()), 5);
		
		freeBoardList = service.getfreeBoardList(pageInfo1, loginMember.getM_no());
		
		pageInfo2 = new PageInfo(1, 10, service.getQnaBoardCount(loginMember.getM_no()), 5);
		
		qnaBoardList = service.getqnaBoardList(pageInfo2, loginMember.getM_no());
		
		payOrderList = service.getPayOrderList(loginMember.getM_no());
		cancelOrderList = service.getCancelOrderList(loginMember.getM_no());

		model.addObject("orderList", orderList);
		model.addObject("likesList", likesList);
		model.addObject("reviewCount", reviewCount);
		model.addObject("likesListCount", likesList.size());
		model.addObject("freeBoardList", freeBoardList);
		model.addObject("freeBoardListCount", freeBoardList.size());
		model.addObject("qnaBoardList", qnaBoardList);
		model.addObject("qnaBoardListCount", qnaBoardList.size());
		model.addObject("payOrderCount", payOrderList.size());
		model.addObject("cancelOrderCount", cancelOrderList.size());
		
		model.setViewName("mypage/mypage_main");
		
		return model;
	}
	
	@GetMapping("/memberInfo")
	public ModelAndView memberInfo(ModelAndView model) {
		
		model.setViewName("mypage/mypage_viewInfo");
		
		return model;
	}
	
	@GetMapping("/updateMember")
	public ModelAndView updateMember(ModelAndView model) {
		
		model.addObject("type", "updateMember");
		model.setViewName("mypage/mypage_pwdCheck");
		
		return model;
	}
	
	@GetMapping("/updatePwd")
	public ModelAndView updatePwd(ModelAndView model) {
		
		model.setViewName("mypage/mypage_updatePwd");
		
		return model;
	}
	
	@PostMapping("/updatePwd")
	public ModelAndView updatePwd(ModelAndView model,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(value = "password") String password,
								@RequestParam(value = "newpassword") String newpassword,
								@RequestParam(value = "newpasswordcheck") String newpasswordcheck) {
		
		int result = 0;
		
		if(passwordEncoder.matches(password, loginMember.getM_password())) {
			result = service.updateMemberPwd(loginMember.getM_no(), passwordEncoder.encode(newpassword));
			
			if(result > 0) {
				model.addObject("msg", "비밀번호 변경이 완료되었습니다. 다시 로그인해 주세요.");
				model.addObject("location", "/member/logout");
			} else {
				model.addObject("msg", "비밀번호 변경에 실패하였습니다.");
				model.addObject("location", "/mypage/updatePwd");
			}
		} else {
			model.addObject("msg", "현재 비밀번호가 일치하지 않습니다.");
			model.addObject("location", "/mypage/updatePwd");
		}
		model.setViewName("common/msg");	
		
		return model;
	}
	
	@PostMapping("/pwdCheck")
	public ModelAndView pwdCheck(ModelAndView model,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(value = "userpwd") String pwd,
								@RequestParam(value = "type") String type) {
		
		
		if(passwordEncoder.matches(pwd, loginMember.getM_password())) {
			if(type.equals("updateMember")) {
				model.setViewName("mypage/mypage_updateInfo");
			} else if(type.equals("deleteMember")) {
				model.setViewName("mypage/mypage_deleteMember");
			}
		} else {
			if(type.equals("updateMember")) {
				model.addObject("location", "/mypage/updateMember");
			} else {
				model.addObject("location", "/mypage/main");
			}
			model.addObject("msg", "비밀번호가 일치하지 않습니다.");
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@PostMapping("/updateMember")
	public ModelAndView updateMember(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@ModelAttribute Member member) {
		int result = 0;
		
		member.setM_no(loginMember.getM_no());
		
		System.out.println(member);
		
		result = service.updateMember(member);
		
		if(result > 0) {
			loginMember.setM_name(member.getM_name());
			loginMember.setM_email(member.getM_email());
			loginMember.setM_phone(member.getM_phone());
			loginMember.setM_address(member.getM_address());
			loginMember.setM_birth(member.getM_birth());
			loginMember.setM_gender(member.getM_gender());
			loginMember.setM_postNum(member.getM_postNum());
			loginMember.setM_detailAddress(member.getM_detailAddress());
			model.addObject("msg", "정보 수정이 완료되었습니다.");
		} else {
			model.addObject("msg", "정보 수정이 실패하였습니다.");
		}
		
		
		model.addObject("location", "/mypage/memberInfo");

		model.setViewName("common/msg");	
		
		return model;
	}
	
	@GetMapping("/deleteMember")
	public ModelAndView deleteMember(ModelAndView model) {
		
		model.addObject("type", "deleteMember");
		model.setViewName("mypage/mypage_pwdCheck");
		
		return model;
	}
	
	@PostMapping("/deleteMember")
	public ModelAndView deleteMember(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember) {
		
		int result = 0;
				
		result = service.deleteMember(loginMember.getM_no());
		
		if(result > 0) {
			model.addObject("msg", "정상적으로 탈퇴되었습니다.");
			model.addObject("location", "/member/logout");
		} else {
			model.addObject("msg", "회원 탈퇴를 실패하였습니다.");
			model.addObject("location", "/mypage/main");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/dibsContent")
	public ModelAndView dibsContent(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "type", defaultValue = "영화") String type,
									@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Contents> likesList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getLikesCount(loginMember.getM_no(), type), 8);
				
		likesList = service.getLikesList(pageInfo, loginMember.getM_no(), type);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("likesList", likesList);
		model.addObject("type", type);
		model.setViewName("mypage/mypage_dibsContent");
		
		return model;
	}
	
	@GetMapping("/dibsContentSearch")
	public ModelAndView dibsContentSearch(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "type", defaultValue = "영화") String type,
									@RequestParam(value = "page", defaultValue = "1") int page,
									@RequestParam(value = "searchType") String searchType,
									@RequestParam(value = "searchVal") String searchVal) {
		
		List<Contents> likesList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getLikesSearchCount(loginMember.getM_no(), type, searchType, searchVal), 8);
				
		likesList = service.getLikesSearchList(pageInfo, loginMember.getM_no(), type, searchType, searchVal);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("likesList", likesList);
		model.addObject("type", type);
		model.addObject("searchType", searchType);
		model.addObject("searchVal", searchVal);
		model.setViewName("mypage/mypage_dibsContentSearch");
		
		return model;
	}
	
	@GetMapping("/deleteDibsContent")
	public ModelAndView deleteDibsContent(ModelAndView model,
										@SessionAttribute("loginMember") Member loginMember,
										@RequestParam(value = "list") List<Integer> list,
										@RequestParam(value = "type", defaultValue = "영화") String type
										) {
		
		int result = 0;
		
		result = service.deleteDibsContent(loginMember.getM_no(), list);
		
		
		if(result > 0) {
			model.addObject("msg", "삭제가 완료되었습니다.");
			model.addObject("location", "/mypage/dibsContent?type=" + type);
		} else {
			model.addObject("msg", "삭제중 오류가 발생하였습니다.");
			model.addObject("location", "/mypage/dibsContent?type=" + type);
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/reviewContent")
	public ModelAndView reviewContent(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "type", defaultValue = "영화") String type,
									@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Contents> reviewList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getReviewCount(loginMember.getM_no(), type), 8);
		
		reviewList = service.getReviewList(pageInfo, loginMember.getM_no(), type);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("reviewList", reviewList);
		model.addObject("type", type);
		model.setViewName("mypage/mypage_reviewContent");
		
		return model;
	}
	
	@GetMapping("/reviewContentSearch")
	public ModelAndView reviewContentSearch(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "type", defaultValue = "영화") String type,
									@RequestParam(value = "page", defaultValue = "1") int page,
									@RequestParam(value = "searchType") String searchType,
									@RequestParam(value = "searchVal") String searchVal) {
		
		List<Contents> reviewList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getReviewSearchCount(loginMember.getM_no(), type, searchType, searchVal), 8);
		
		reviewList = service.getReviewSearchList(pageInfo, loginMember.getM_no(), type, searchType, searchVal);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("reviewList", reviewList);
		model.addObject("type", type);
		model.addObject("searchType", searchType);
		model.addObject("searchVal", searchVal);
		model.setViewName("mypage/mypage_reviewContentSearch");
		
		return model;
	}
	
	
	@GetMapping("/writeFreeBoard")
	public ModelAndView writeFreeBoard(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Board> freeBoardList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getFreeBoardCount(loginMember.getM_no()), 10);
		
		freeBoardList = service.getfreeBoardList(pageInfo, loginMember.getM_no());
		
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("freeBoardList", freeBoardList);
		model.setViewName("mypage/mypage_writeFreeBoard");
		
		return model;
	}
	
	@GetMapping("/writeFreeBoardSearch")
	public ModelAndView writeFreeBoardSearch(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "page", defaultValue = "1") int page,
									@RequestParam(value = "searchType") String searchType,
									@RequestParam(value = "searchVal") String searchVal) {
		
		List<Board> freeBoardList = null;
		PageInfo pageInfo = null;
		
		
		pageInfo = new PageInfo(page, 10, service.getFreeBoardSearchCount(loginMember.getM_no(), searchType, searchVal), 10);
				
		freeBoardList = service.getfreeBoardSearchList(pageInfo, loginMember.getM_no(), searchType, searchVal);
		
		model.addObject("pageInfo", pageInfo);
		model.addObject("freeBoardList", freeBoardList);
		model.addObject("searchType", searchType);
		model.addObject("searchVal", searchVal);
		model.setViewName("mypage/mypage_writeFreeBoardSearch");
		
		return model;
	}
	
	@GetMapping("/writeQuestionBoard")
	public ModelAndView writeQuestionBoard(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Board> qnaBoardList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getQnaBoardCount(loginMember.getM_no()), 10);
		
		qnaBoardList = service.getqnaBoardList(pageInfo, loginMember.getM_no());

		model.addObject("pageInfo", pageInfo);
		model.addObject("qnaBoardList", qnaBoardList);
		model.setViewName("mypage/mypage_writeQuestionBoard");
		
		return model;
	}
	
	@GetMapping("/writeQuestionBoardSearch")
	public ModelAndView writeQuestionBoardSearch(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "page", defaultValue = "1") int page,
									@RequestParam(value = "searchType") String searchType,
									@RequestParam(value = "searchVal") String searchVal) {
		
		List<Board> qnaBoardList = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getQnaBoardSearchCount(loginMember.getM_no(), searchType, searchVal), 10);
		
		qnaBoardList = service.getqnaBoardSearchList(pageInfo, loginMember.getM_no(), searchType, searchVal);

		model.addObject("pageInfo", pageInfo);
		model.addObject("qnaBoardList", qnaBoardList);
		model.addObject("searchType", searchType);
		model.addObject("searchVal", searchVal);
		
		model.setViewName("mypage/mypage_writeQuestionBoardSearch");
		
		return model;
	}
	
	@GetMapping("/payList")
	public ModelAndView payList(ModelAndView model,
								@SessionAttribute("loginMember") Member loginMember,
								@RequestParam(value = "dateFrom", required = false) String dateFrom,
								@RequestParam(value = "dateTo", required = false) String dateTo) {
		
		List<Order> orderList = new ArrayList<Order>();
		
		orderList = service.getOrderListByMNo(loginMember.getM_no(), dateFrom, dateTo);
		
		
		model.addObject("orderList", orderList);
		model.setViewName("mypage/mypage_pay_list");
		
		return model;
	}
	
	@GetMapping("/payCancelList")
	public ModelAndView payCancelList(ModelAndView model,
									@SessionAttribute("loginMember") Member loginMember,
									@RequestParam(value = "dateFrom", required = false) String dateFrom,
									@RequestParam(value = "dateTo", required = false) String dateTo) {
		
		List<Order> orderList = new ArrayList<Order>();
		
		orderList = service.getOrderCancelOrderListByMNo(loginMember.getM_no(), dateFrom, dateTo);
		
		model.addObject("orderList", orderList);

		model.setViewName("mypage/mypage_pay_cancelList");
		
		return model;
	}
	
	@GetMapping("/payDetail")
	public ModelAndView payDetail(ModelAndView model,
								@RequestParam(value = "payNo") int payNo) {
		
		Order order = service.getOrderByPayNo(payNo);
		
		System.out.println(order);
		
		model.addObject("order", order);
		model.setViewName("mypage/mypage_pay_detail");
		
		return model;
	}
	
	@GetMapping("/payCancel")
	public ModelAndView payCancel(ModelAndView model,
								HttpServletRequest request,
								@RequestParam(value = "payNo") int payNo) {
		
		String path = request.getHeader("Referer").substring(request.getHeader("Referer").indexOf(request.getContextPath()) + request.getContextPath().length());
		int result = 0;
		
		result = service.payCancel(payNo);
		
		if(result > 0) {
			model.addObject("msg", "환불요청이 완료되었습니다.");
		} else {
			model.addObject("msg", "환불요청이 실패하였습니다.");
		}
		model.addObject("location", path);
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/refundCancel")
	public ModelAndView refundCancel(ModelAndView model,
			HttpServletRequest request,
			@RequestParam(value = "payNo") int payNo) {
		
		String path = request.getHeader("Referer").substring(request.getHeader("Referer").indexOf(request.getContextPath()) + request.getContextPath().length());
		int result = 0;
		
		result = service.refundCancel(payNo);
		
		if(result > 0) {
			model.addObject("msg", "환불 취소 요청이 완료되었습니다.");
		} else {
			model.addObject("msg", "환불 취소 요청이 실패하였습니다.");
		}
		model.addObject("location", path);
		model.setViewName("common/msg");
		
		return model;
	}
}
