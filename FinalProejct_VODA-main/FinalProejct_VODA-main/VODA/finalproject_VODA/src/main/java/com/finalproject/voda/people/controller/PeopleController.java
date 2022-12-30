package com.finalproject.voda.people.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.common.util.MultipartFileUtil;
import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.common.util.Search;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.people.model.service.PeopleService;
import com.finalproject.voda.people.model.vo.People;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
//@RequestMapping("/people")

public class PeopleController {
	@Autowired
	private PeopleService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/admin/admin_people")
	public ModelAndView list(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<People> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getPeopleCount(), 12);
		list = service.getPeopleList(pageInfo);
				
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("admin/admin_people");
		
		return model;
	}
	
	
	@GetMapping("/people/people")
	public ModelAndView people(ModelAndView model, @RequestParam int people_no) {
		People people = null;
		
		people = service.findPeopleByNo(people_no);
		
		model.addObject("people", people);
		model.setViewName("people/people");
		
		return model;
	}
	
	
	@GetMapping("/admin/peopleEnroll") 
	public String peopleEnroll() {
		
		return "admin/peopleEnroll"; 
		
	}
	
	@PostMapping("/admin/peopleEnroll")
	public ModelAndView peopleEnroll(
			ModelAndView model,
			@ModelAttribute People people,
			@RequestParam("upfile") MultipartFile upfile
//			,@SessionAttribute("loginMember") Member loginMember
			) {
		
		int result = 0;
		// 파일을 업로드 하지 않으면 true, 파일을 업로드하면 false
		log.info("Upfile is Empty : {}", upfile.isEmpty());
		// 파일을 업로드 하지 않으면 "", 파일을 업로드하면 "파일명"
		log.info("Upfile Name : {}", upfile.getOriginalFilename());
		
		// 1. 파일을 업로드 했는지 확인 후 파일을 저장
		if(upfile != null && !upfile.isEmpty()) {
			// 파일을 저장하는 로직
			
			String location = null;
			String renamedFileName = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/people").getFile().getPath();
				renamedFileName = MultipartFileUtil.save(upfile, location);
				
				System.out.println(location);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName != null) {
				people.setPeople_original_filename(upfile.getOriginalFilename());
				people.setPeople_renamed_filename(renamedFileName);
				log.info("renamedFileName: " + renamedFileName);
			}
		}
		
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
//		people.setPeople_no(loginMember.getM_no());
		result = service.save(people);
		System.out.println(people);
		System.out.println(result);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/people/people?people_no=" + people.getPeople_no());
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/admin/peopleEnroll");
		}
		
		model.setViewName("common/msg");
		
		return model;
		
	}
	
	@GetMapping("/admin/peopleUpdate")
	public ModelAndView update(
			ModelAndView model,
			@RequestParam int people_no){
		 People people = null;
		 
		 people = service.findPeopleByNo(people_no);
		
		 model.addObject("people", people);
		 model.setViewName("admin/peopleUpdate");
		
		return model;
	}
	
	@RequestMapping("/admin/peopleUpdate")
	public ModelAndView update(
			ModelAndView model,
			@ModelAttribute People people,
			@RequestParam("upfile") MultipartFile upfile) {
		int result = 0;
		String location = null;
		String renamedFileName = null;
		
		if(upfile != null && !upfile.isEmpty()) {
			try {
				location = resourceLoader.getResource("resources/upload/people").getFile().getPath();
			
				if(people.getPeople_renamed_filename() != null) {
					MultipartFileUtil.delete(location + "/" + people.getPeople_renamed_filename());
				}
			
				renamedFileName = MultipartFileUtil.save(upfile, location);
				
				if(renamedFileName != null) {
					people.setPeople_original_filename(upfile.getOriginalFilename());
					people.setPeople_renamed_filename(renamedFileName);
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
			result = service.save(people);
		
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/people/people?people_no=" + people.getPeople_no());
			} else {
				model.addObject("msg", "게시글 수정을 실패하였습니다.");
				model.addObject("location", "/admin/peopleUpdate?people_no=" + people.getPeople_no());
			}
			
			model.setViewName("common/msg");
			
			return model;
		}	
	
	@GetMapping("/admin/peopleDelete")
	public ModelAndView delete(ModelAndView model,
								@RequestParam(value = "list") List<Integer> list) {
		
		int result = 0;
		
		System.out.println(list);
		result = service.deletePeople(list);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/admin/admin_people");
		} else {
			model.addObject("msg", "삭제중 오류가 발생하였습니다.");
			model.addObject("location", "/admin/admin_people");
		}
		
		model.setViewName("common/msg");
		
		return model;
	}
	
	
	@GetMapping("/people/peopleOnclickButton") 
	public String peopleOnclickButton() {
		
		return "people/peopleOnclickButton"; 
		
	}
	
	// 인물페이지 리스트 검색
	@GetMapping("/admin/admin_people_search")
	public ModelAndView adminPeopleSearch(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam String searchType,
			@RequestParam String keyword) {

		List<Search> search = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getPeopleSearchCount(searchType, keyword), 12);
		search = service.getPeopleSearchList(pageInfo, searchType, keyword);
				
		System.out.println(search);

		model.addObject("search", search);
		model.addObject("searchType", searchType);
		model.addObject("keyword", keyword);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("admin/admin_people_search");
		
		return model;
	}

}
