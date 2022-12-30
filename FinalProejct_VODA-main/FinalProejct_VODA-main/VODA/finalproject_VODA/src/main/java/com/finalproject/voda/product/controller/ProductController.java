package com.finalproject.voda.product.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.product.model.service.ProductService;
import com.finalproject.voda.product.model.vo.Product;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	
	@GetMapping("/product_all_list")
	public ModelAndView all_list(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page) {
		List<Product> product = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getProductAllCount(), 10);
		product = service.getProductList(pageInfo);
		
		model.addObject("product", product);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("product/product_all_list");
		
		return model;
	}
	
	@GetMapping("/product_detail")
	public ModelAndView view(ModelAndView model, @RequestParam int pno) {
		Product product = null;
		product = service.findProductByNo(pno);
		
		List<String> imgList = new ArrayList<String>();
		String[] splitImg = product.getPrenamefile().split(", ");
		
		for (int i = 0; i < splitImg.length; i++) {
			imgList.add(splitImg[i]);
		}

		model.addObject("imgList", imgList);
		model.addObject("product", product);
		model.setViewName("product/product_detail");
		
		return model;
	}
	
	@GetMapping("/product_create")
	public String ProductCreate() {
		log.info("게시글 작성 페이지 요청");
		return "product/product_create";
	}
	
	@PostMapping("/product_create")
	public ModelAndView ProductCreate(
						ModelAndView model,
						@RequestParam(value="multiFile") List<MultipartFile> multiFileList,HttpServletRequest request,
						@ModelAttribute Product product) {
		int result = 0;
		// 받아온것 출력 확인
				System.out.println("multiFileList : " + multiFileList);

				// path 가져오기
				String path = request.getSession().getServletContext().getRealPath("resources");
				String root = path + "\\" + "uploadFiles";
				
				File fileCheck = new File(root);
				
				if(!fileCheck.exists()) fileCheck.mkdirs();
				
				String file1 = "";
				String file2 = "";
				
				Map<String, String> map = new HashMap<>();
				
				for(int i = 0; i < multiFileList.size(); i++) {
					String poriginfile = multiFileList.get(i).getOriginalFilename();
					
					String prenamefile = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
							poriginfile.substring(poriginfile.lastIndexOf("."));
					int subFileName = Integer.parseInt(prenamefile.substring(9, 18)) + i;
					prenamefile = prenamefile.substring(0, 9) + subFileName + prenamefile.substring(18, prenamefile.length());

					if(i == 0) {
		                map.put("poriginfile", poriginfile);
		                map.put("prenamefile", prenamefile);
		            }
		            else {
		                map.put("poriginfile", map.get("poriginfile") + ", " + poriginfile);
		                map.put("prenamefile", map.get("prenamefile") + ", " + prenamefile);
		            }
					
				}
				
				file1 = map.get("poriginfile");
				file2 = map.get("prenamefile");
				
				product.setPoriginfile(file1);
				product.setPrenamefile(file2);
				
				String[] fileList = map.get("prenamefile").split(", ");
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(root + "\\" + fileList[i]);
						multiFileList.get(i).transferTo(uploadFile);
					}
					System.out.println("다중 파일 업로드 성공!");
					System.out.println("파일" + multiFileList);
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList[i]).delete();
					}
					e.printStackTrace();
				}
		
		result = service.insertProduct(product);
		
		// 게시글 관련 DB 저장
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/product/product_detail?pno=" + product.getPno());
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/product/product_create");
		}
		model.setViewName("common/msg");
		System.out.println(result);
		return model;
	}
	
	@GetMapping("/product_delete")
	public ModelAndView ProductDelete(
						ModelAndView model,
						@RequestParam int pno) {
		int result = 0;
		Product product = null;
		
		product = service.findProductByNo(pno);
		
		result = service.deleteProduct(pno);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 삭제되었습니다.");
			model.addObject("location", "/product/product_all_list");
		} else {
			model.addObject("msg", "게시글 삭제를 실패하였습니다.");
			model.addObject("location", "/product/product_detail?pno=" + pno);
		}
		model.setViewName("common/msg");
		
		return model;
	}
	
	@GetMapping("/product_update")
	public ModelAndView update(
			ModelAndView model, 
			@RequestParam int pno) {
		Product product = null;
		
		product = service.findProductByNo(pno);
		
			model.addObject("product", product);
			model.setViewName("product/product_update");
		
		return model;
	}
	
	@PostMapping("/product_update")
	public ModelAndView ProductUpdate(
						ModelAndView model,
						@RequestParam(value="multiFile") List<MultipartFile> multiFileList,HttpServletRequest request,
//						@RequestParam("upfile") MultipartFile upfile,
						@ModelAttribute Product product) {
		int result = 0;
		// 받아온것 출력 확인
				System.out.println("multiFileList : " + multiFileList);

				// path 가져오기
				String path = request.getSession().getServletContext().getRealPath("resources");
				String root = path + "\\" + "uploadFiles";
				
				File fileCheck = new File(root);
				
				if(!fileCheck.exists()) fileCheck.mkdirs();
				
				String file1 = "";
				String file2 = "";
				
				Map<String, String> map = new HashMap<>();
				
				for(int i = 0; i < multiFileList.size(); i++) {
					String poriginfile = multiFileList.get(i).getOriginalFilename();
					
					String prenamefile = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmssSSS")) + 
							poriginfile.substring(poriginfile.lastIndexOf("."));
					int subFileName = Integer.parseInt(prenamefile.substring(9, 18)) + i;
					prenamefile = prenamefile.substring(0, 9) + subFileName + prenamefile.substring(18, prenamefile.length());

					if(i == 0) {
		                map.put("poriginfile", poriginfile);
		                map.put("prenamefile", prenamefile);
		            }
		            else {
		                map.put("poriginfile", map.get("poriginfile") + ", " + poriginfile);
		                map.put("prenamefile", map.get("prenamefile") + ", " + prenamefile);
		            }
					
				}
				
				file1 = map.get("poriginfile");
				file2 = map.get("prenamefile");
				
				product.setPoriginfile(file1);
				product.setPrenamefile(file2);
				
				String[] fileList = map.get("prenamefile").split(", ");
				
				try {
					for(int i = 0; i < multiFileList.size(); i++) {
						File uploadFile = new File(root + "\\" + fileList[i]);
						multiFileList.get(i).transferTo(uploadFile);
					}
					System.out.println("다중 파일 업로드 성공!");
					System.out.println("파일" + multiFileList);
					
				} catch (IllegalStateException | IOException e) {
					System.out.println("다중 파일 업로드 실패 ㅠㅠ");
					// 만약 업로드 실패하면 파일 삭제
					for(int i = 0; i < multiFileList.size(); i++) {
						new File(root + "\\" + fileList[i]).delete();
					}
					e.printStackTrace();
				}
		
		result = service.updateProduct(product);
		
		// 게시글 관련 DB 저장
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
			model.addObject("location", "/product/product_detail?pno=" + product.getPno());
		} else {
			model.addObject("msg", "게시글 수정을 실패하였습니다.");
			model.addObject("location", "/product/product_create");
		}
		model.setViewName("common/msg");
		System.out.println(result);
		return model;
	}
	
	@GetMapping("/product_search")
	public ModelAndView all_list_search(ModelAndView model, 
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam String searchtype,
			@RequestParam String searchname) {
		List<Product> product = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 10, service.getProductSearchCount(searchtype, searchname), 10);
		product = service.getProductSearchList(pageInfo, searchtype, searchname);
		
		model.addObject("product", product);
		model.addObject("searchtype", searchtype);
		model.addObject("searchname", searchname);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("product/product_search");
		System.out.println(product);
		return model;
	}
	
	@GetMapping("/product_popular_list")
	public ModelAndView popular_list(ModelAndView model) {
		List<Product> product = null;
		
		
		model.addObject("product", product);
		model.setViewName("product/product_popular_list");
		
		return model;
	}
	
	
	
	
	
	
}
