package com.finalproject.voda.board.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.admin.model.vo.Notice;
import com.finalproject.voda.board.model.service.BoardService;
import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.board.model.vo.Comments;
import com.finalproject.voda.common.util.MultipartFileUtil;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
@SessionAttributes("loginMember")
public class BoardController {
	@Autowired
	private BoardService service;
	@Autowired
	private ResourceLoader resourceLoader;

// 	자유게시판 리스트
	@GetMapping("/free_board_list")
	public ModelAndView boardList(ModelAndView model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Board> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount("FREE"), 15);
		list = service.getBoardList(pageInfo, "FREE");
		
		
		model.addObject("list", list);
		model.addObject("pageInfo",pageInfo);	
		model.setViewName("/board/free_board_list");
		
		return model;
	}
	
	// 자유게시판 리스트 검색
	@GetMapping("/free_board_search")
	public ModelAndView BoardSearch(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam String searchType,
			@RequestParam String keyword) {

		List<Search> search = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getBoardSearchCount(searchType, keyword), 15);
		search = service.getBoardSearchList(pageInfo, searchType, keyword);
		
		model.addObject("search", search);
		model.addObject("searchType", searchType);
		model.addObject("keyword", keyword);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/free_board_search");
		
		return model;
	}
	
	// 문의게시판 리스트 검색
	@GetMapping("/question_board_search")
	public ModelAndView QnaSearch(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam String searchType,
			@RequestParam String keyword) {

		List<Search> search = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getQnaSearchCount(searchType, keyword), 15);
		search = service.getQnaSearchList(pageInfo, searchType, keyword);
		
		model.addObject("search", search);
		model.addObject("searchType", searchType);
		model.addObject("keyword", keyword);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("board/question_board_search");
		
		return model;
	}
	
	
// 	문의게시판 리스트
	@GetMapping("/question_board_list")
	public ModelAndView qnaList(ModelAndView model, @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<Board> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getBoardCount("QNA"), 15);
		list = service.getBoardList(pageInfo, "QNA");
		
		System.out.println(list);
		
		model.addObject("list", list);
		model.addObject("pageInfo",pageInfo);	
		model.setViewName("/board/question_board_list");
		
		return model;
	}
	
// 	자유게시판 조회
	@GetMapping("/free_board_detail")
	public ModelAndView boardView(ModelAndView model, @RequestParam int no,
			HttpServletRequest request, HttpServletResponse response) {
		Board board = null;
		
    	// 조회수 쿠키 관련
    	Cookie[] cookies = request.getCookies();
    	String viewhistory = "";
    	boolean hasRead = false;
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
    			name = cookie.getName();
				value = cookie.getValue();
			
			if(name.equals("viewhistory")) {
				viewhistory = value;
				
				if(value.contains("|" + no + "|")) {
					hasRead = true;
					
					break;
				}
			}
		}
    }

    	if(!hasRead) {    		
    		Cookie cookie = new Cookie("viewhistory" ,viewhistory +  "|" +  no + "|");
    		
    		cookie.setMaxAge(-1); 
    		response.addCookie(cookie);
    	}
    	
    	HttpSession session = request.getSession(false);
    	Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
//    	--------------------- 조회수 -----------------------------------------------------------
    	
		board = service.findBoardByNo(no, hasRead);
		
		System.out.println(no);
		System.out.println(board);
		
		model.addObject("board", board);
		model.setViewName("/board/free_board_detail");
		
		return model;
	}
	
// 	문의게시판 조회
	@GetMapping("/question_board_detail")
	public ModelAndView qnaView(ModelAndView model, @RequestParam int no) {
		Board board = null;
		
		board = service.findBoardByNo(no, true);
		
		System.out.println(no);
		System.out.println(board);
		
		model.addObject("board", board);
		model.setViewName("/board/question_board_detail");
		
		return model;
	}
	
// 자유게시판 삭제 
	@GetMapping("/free_board_delete")
	public ModelAndView delete(
			ModelAndView model,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam int no) {
		int result = 0;
		Board board = null;
		board = service.findBoardByNo(no, true);
		
		if(board.getMid().equals(loginMember.getM_id()) || loginMember.getM_authorization().equals("M")) {
			
			result = service.deleteFree(no);
			
			if(result > 0) {
				model.addObject("msg", "게시글 삭제 성공");
				model.addObject("location", "/board/free_board_list");	
			} else {
				model.addObject("msg", "게시글 삭제 실패");
				model.addObject("location", "/board/free_board_detail?no=" + no);	
			}
		} else {
			model.addObject("msg", "잘못된 접근입니다.");
			model.addObject("location", "/board/free_board_list");
		}
		
		
		model.setViewName("common/msg");
		
		return model;
	}
	
// 문의게시판 삭제 
		@GetMapping("/question_board_delete")
		public ModelAndView qnadelete(
				ModelAndView model,
				@SessionAttribute("loginMember") Member loginMember,
				@RequestParam int no) {
			int result = 0;
			Board board = null;
			board = service.findBoardByNo(no, true);
			
			if(board.getMid().equals(loginMember.getM_id()) || loginMember.getM_authorization().equals("M")) {
				
				result = service.deleteFree(no);
				
				if(result > 0) {
					model.addObject("msg", "게시글 삭제 성공");
					model.addObject("location", "/board/question_board_list");	
				} else {
					model.addObject("msg", "게시글 삭제 실패");
					model.addObject("location", "/board/question_board_detail?no=" + no);	
				}
			} else {
				model.addObject("msg", "잘못된 접근입니다.");
				model.addObject("location", "/board/question_board_list");
			}
			
			
			model.setViewName("common/msg");
			
			return model;
		}	

//	자유게시판 작성 (접근)
	@GetMapping("/free_board_crud")
	public String write() {

		return "/board/free_board_crud";
	}
	

//	자유게시판 작성 (등록 버튼 시) 
	@PostMapping("/free_board_crud")
	public ModelAndView write(
			ModelAndView model,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute("loginMember") Member loginMember
			) {
		int result = 0;
		
		log.info("upfile is empty : {}",upfile.isEmpty());
		log.info("upfile Name : {}",upfile.getOriginalFilename());
		
		if(upfile != null && !upfile .isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
			
				renamedFileName = MultipartFileUtil.save(upfile,location);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				board.setBoriginalfilename(upfile.getOriginalFilename());
				board.setBrenamedfilename(renamedFileName);
			}
						
		}
		board.setMno(loginMember.getM_no());
		result = service.saveBoard(board);
		
		System.out.println(result);
		System.out.println(board);
		if(result > 0) {
			model.addObject("msg", "게시글 등록 성공");
			model.addObject("location", "/board/free_board_list?no=" + board.getBno());
		} else {
			model.addObject("msg", "게시글 등록 실패");
			model.addObject("location", "/board/free_board_crud");	
		}
		
		model.setViewName("common/msg");

		
		return model;
	}
	
//	문의게시판 작성 (접근)
	@GetMapping("/question_board_crud")
	public String qnawrite() {

		return "/board/question_board_crud";
	}
	

//	문의게시판 작성 (등록 버튼 시) 
	@PostMapping("/question_board_crud")
	public ModelAndView qnawrite(
			ModelAndView model,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute("loginMember") Member loginMember
			) {
		int result = 0;
		
		log.info("upfile is empty : {}",upfile.isEmpty());
		log.info("upfile Name : {}",upfile.getOriginalFilename());
		
		if(upfile != null && !upfile .isEmpty()) {
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
			
				renamedFileName = MultipartFileUtil.save(upfile,location);
				
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				board.setBoriginalfilename(upfile.getOriginalFilename());
				board.setBrenamedfilename(renamedFileName);
			}
						
		}
		board.setMno(loginMember.getM_no());
		result = service.saveBoard(board);
		
		System.out.println(result);
		System.out.println(board);
		if(result > 0) {
			model.addObject("msg", "게시글 등록 성공");
			model.addObject("location", "/board/question_board_list?no=" + board.getBno());
		} else {
			model.addObject("msg", "게시글 등록 실패");
			model.addObject("location", "/board/question_board_crud");	
		}
		
		model.setViewName("common/msg");

		
		return model;
	}
	
//	자유게시판 파일 다운로드
	@GetMapping("/free_board_detail/fileDown")
	public ResponseEntity<Resource> fileDown(
			@RequestHeader("user-agent") String userAgent,
			@RequestParam String oname, @RequestParam String rname) {
		
		Resource resource = null;
		String downFileName = null;
		
		log.info("oname : {} , rname  : {}", oname,rname);
		log.info("{}",userAgent);
		
		

		try {
		
			resource = resourceLoader.getResource("resources/upload/board/"+rname);
			if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1) {
				downFileName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downFileName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			return ResponseEntity.ok()
								 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
								 .header(HttpHeaders.CONTENT_DISPOSITION,"attachment;filename="+downFileName)
								 .body(resource);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
	
//	문의게시판 파일 다운로드
	@GetMapping("/question_board_detail/qnafileDown")
	public ResponseEntity<Resource> qnafileDown(
			@RequestHeader("user-agent") String userAgent,
			@RequestParam String oname, @RequestParam String rname) {
		
		Resource resource = null;
		String downFileName = null;
		
		log.info("oname : {} , rname  : {}", oname,rname);
		log.info("{}",userAgent);
		
		

		try {
		
			resource = resourceLoader.getResource("resources/upload/board/"+rname);
			if(userAgent.indexOf("MSIE") != -1 || userAgent.indexOf("Trident") != -1) {
				downFileName = URLEncoder.encode(oname, "UTF-8").replaceAll("\\+", "%20");
			} else {
				downFileName = new String(oname.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			return ResponseEntity.ok()
								 .header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE)
								 .header(HttpHeaders.CONTENT_DISPOSITION,"attachment;filename="+downFileName)
								 .body(resource);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
	
//	자유게시판 수정 (접근)
	@GetMapping("/free_board_update")
	public ModelAndView boardUpdate(
			ModelAndView model,
			@RequestParam int no,
			@SessionAttribute("loginMember") Member loginMember)
			{
		
		Board board = null;
				
		board = service.findBoardByNo(no, true);
		
		
		model.addObject("board", board);
		model.setViewName("/board/free_board_update");
		if(board.getMid().equals(loginMember.getM_id())) {
		} else {
			model.addObject("msg","잘못된 접근입니다.");
			model.addObject("location","/board/free_board_list");
			model.setViewName("common/msg");
		}

		return model;
	}
	
//	자유게시판 수정 (수정버튼 클릭 시)
	@PostMapping("/free_board_update")
	public ModelAndView boardUpdate(
			ModelAndView model,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute("loginMember") Member loginMember) 
	{
		
		int result = 0;

		System.out.println(board.getBno());
		System.out.println(board.getMid());
		
		if (service.findBoardByNo(board.getBno(), true).getMid().equals(loginMember.getM_id())) {
			
			if (upfile != null && !upfile.isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					
					location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
					
					if(board.getBrenamedfilename() != null) {
						MultipartFileUtil.delete(location + "/" + board.getBrenamedfilename());
					}
					
					renamedFileName = MultipartFileUtil.save(upfile, location);
					
					if(renamedFileName != null) {
						board.setBoriginalfilename(upfile.getOriginalFilename());
						board.setBrenamedfilename(renamedFileName);
					}
					
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			result = service.saveBoard(board);
			System.out.println("업데이트"+board);
			System.out.println("업데이트"+board.getBno());
			
			if(result > 0) { 
				model.addObject("msg","게시글이 정상적으로 수정되었습니다.");
				model.addObject("location","/board/free_board_detail?no=" + board.getBno());
				
			} else {
				model.addObject("msg","게시글이 수정 실패.");
				model.addObject("location","/board/free_board_detail?no" + board.getBno());
				
			}
		
		} else {
			model.addObject("msg","잘못된 접근입니다.");
			model.addObject("location","/board/free_board_list");
			}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
//	문의게시판 수정 (접근)
	@GetMapping("/question_board_update")
	public ModelAndView qnaUpdate(
			ModelAndView model, 
			@RequestParam int no,
			@SessionAttribute("loginMember") Member loginMember)
			{
		
		Board board = null;
				
		board = service.findBoardByNo(no, true);
		
		
		model.addObject("board", board);
		model.setViewName("/board/question_board_update");
		if(board.getMid().equals(loginMember.getM_id())) {
		} else {
			model.addObject("msg","잘못된 접근입니다.");
			model.addObject("location","/board/question_board_list");
			model.setViewName("common/msg");
		}

		return model;
	}
	
//	문의게시판 수정 (수정버튼 클릭 시)
	@PostMapping("/question_board_update")
	public ModelAndView questionUpdate(
			ModelAndView model,
			@ModelAttribute Board board,
			@RequestParam("upfile") MultipartFile upfile,
			@SessionAttribute("loginMember") Member loginMember) 
	{
		
		int result = 0;

		System.out.println(loginMember.getM_id());
		System.out.println(board.getBno());
		System.out.println(board.getMid());
		
		if (service.findBoardByNo(board.getBno(), true).getMid().equals(loginMember.getM_id())) {
			
			if (upfile != null && !upfile.isEmpty()) {
				String location = null;
				String renamedFileName = null;
				
				try {
					
					location = resourceLoader.getResource("resources/upload/board").getFile().getPath();
					
					if(board.getBrenamedfilename() != null) {
						MultipartFileUtil.delete(location + "/" + board.getBrenamedfilename());
					}
					
					renamedFileName = MultipartFileUtil.save(upfile, location);
					
					if(renamedFileName != null) {
						board.setBoriginalfilename(upfile.getOriginalFilename());
						board.setBrenamedfilename(renamedFileName);
					}
					
					
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			}
			result = service.saveBoard(board);
			System.out.println("업데이트"+board);
			System.out.println("업데이트"+board.getBno());
			
			if(result > 0) { 
				model.addObject("msg","게시글이 정상적으로 수정되었습니다.");
				model.addObject("location","/board/question_board_detail?no=" + board.getBno());
				
			} else {
				model.addObject("msg","게시글이 수정 실패.");
				model.addObject("location","/board/question_board_detail?no" + board.getBno());
				
			}
		
		} else {
			model.addObject("msg","잘못된 접근입니다.");
			model.addObject("location","/board/question_board_list");
			}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	// 게시판 댓글 작성
	@RequestMapping("/commentswrite")
	@ResponseBody
	public Map<String, Object> commentswrite(@RequestBody HashMap<String, Object> comments) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		System.out.println("파라미터 객체 : " + comments);
		
		int result = 0;
		
		result = service.commentswrite(comments);
		
		if(result > 0 ) {
			System.out.println("값: " + result);
			result = service.answerstatus(comments);
			
			resultMap.put("comments", comments);
		} else {
			resultMap.put("data", "fail");
		}
		return comments;
	}
	
	//	게시판 댓글 삭제
	@RequestMapping("/commentsdelete")
	@ResponseBody
	public Map<String, Object> commentsdelete(@RequestBody HashMap<String, Object> comments) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		System.out.println("파라미터 객체 : " + comments);
		
		int result = 0;
		
		result = service.commentsdelete(comments);
		
		if(result > 0 ) {
			System.out.println("값: " + result);
			int answerdelete = service.answerdelete(comments);
			resultMap.put("comments", comments);
		} else {
			resultMap.put("data", "fail");
		}
		return comments;
	}
	
	//	게시판 댓글 수정
	@RequestMapping("/commentsupdate")
	@ResponseBody
	public Map<String, Object> commentsupdate(@RequestBody HashMap<String, Object> comments) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		
		System.out.println("파라미터 객체 : " + comments);
		
		int updatetime = service.updatetime(comments);
		int result = 0;
		
		if(updatetime > 0 ) {
			result = service.commentsupdate(comments);
			
			if(result > 0 ) {
				System.out.println("값: " + result);
				resultMap.put("comments", comments);
			} else {
				resultMap.put("data", "fail");
			}
		}
		return comments;
	}
	
	

	
	// 일반회원 조회용 공지사항
	// 공지사항 리스트
	@GetMapping("/notice_list") 
	public ModelAndView noticeList(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page)  {
		
		List<Notice> list = null;
		PageInfo pageInfo = null;	
		
		pageInfo = new PageInfo(page, 10, service.getNoticeCount(), 10);
		list = service.getNoticeList(pageInfo);
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);	
		model.setViewName("/board/notice_list");

		return model; 
	}


	// 공지사항 리스트 검색
	@GetMapping("/notice_search")
	public ModelAndView NoticeSearch(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam String searchType,
			@RequestParam String keyword) {

		List<Search> search = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getNoticeSearchCount(searchType, keyword), 10);
		search = service.getNoticeSearchList(pageInfo, searchType, keyword);
		
		model.addObject("search", search);
		model.addObject("searchType", searchType);
		model.addObject("keyword", keyword);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("/board/notice_search");
		
		return model;
	}

//		공지사항 조회
	@GetMapping("/notice_detail")
	public ModelAndView noticeView(ModelAndView model, @RequestParam int no,
			HttpServletRequest request, HttpServletResponse response) {
		Notice notice = null;
		
		// 조회수 쿠키 관련
		Cookie[] cookies = request.getCookies();
		String viewhistory = "";
		boolean hasRead = false;
		
		if(cookies != null) {
			String name = null;
			String value = null;
			for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
			
			if(name.equals("viewhistory")) {
				viewhistory = value;
				
				if(value.contains("|" + no + "|")) {
					hasRead = true;
					
					break;
				}
			}
		}
	}

		if(!hasRead) {    		
			Cookie cookie = new Cookie("viewhistory" ,viewhistory +  "|" +  no + "|");
			
			cookie.setMaxAge(-1); 
			response.addCookie(cookie);
		}
		
		HttpSession session = request.getSession(false);
		Member loginMember = (session == null) ? null : (Member) session.getAttribute("member");
		
		
		
		notice = service.findNoticeByNo(no , hasRead);
		
		model.addObject("notice", notice);
		model.setViewName("/board/notice_detail");
		
		return model;
	}
}
