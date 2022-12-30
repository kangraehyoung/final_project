package com.finalproject.voda.cart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.cart.model.service.CartService;
import com.finalproject.voda.cart.model.vo.Cart;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.product.model.service.ProductService;
import com.finalproject.voda.product.model.vo.Product;

@Controller
@RequestMapping("/product")
@SessionAttributes("loginMember")
public class CartController {
	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;
	
	@GetMapping("/product_cart")
	public ModelAndView cart_list (ModelAndView model,
			HttpSession session) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		List<Cart> cart = null;
		
		
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후 이용해주세요.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
		} else {
			
			cart = cartService.getCartList(loginMember.getM_no());
			model.addObject("cart", cart);
			model.addObject("location", "/product/product_cart");
			
		}
		
		
		
		
		return model;
	}
	
	@GetMapping("/cart_insert")
	public ModelAndView cartInsert(
						ModelAndView model,
						@ModelAttribute Cart cart,
						@ModelAttribute Product product,
						HttpSession session) {
		int result = 0;
		Member loginMember = (Member) session.getAttribute("loginMember");
		int pno = product.getPno();
		product = productService.findProductByNo(pno);
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후 이용해주세요.");
			model.addObject("location", "/member/login");
			model.setViewName("common/msg");
		} else {
			Cart cart1 = null;
			cart1 = cartService.getCart(loginMember.getM_no(), pno);
			if(cart1 != null) {
				model.addObject("msg", "이미 등록된 상품입니다.");
				model.addObject("location", "/product/product_detail?pno=" + cart.getPno());
			}
			else {
				cart.setMno(loginMember.getM_no());
				result = cartService.insertCart(cart);
				
				if(result > 0) {
					model.addObject("msg", "장바구니에 등록되었습니다.");
					model.addObject("location", "/product/product_detail?pno=" + cart.getPno());
				} else {
					model.addObject("msg", "장바구니에 등록 실패!");
					model.addObject("location", "/product/product_detail?pno=" + cart.getPno());
				}
			}
			model.setViewName("common/msg");
		}
		
		return model;
	}
	
	@GetMapping("/cart_delete")
	public ModelAndView cartDelete(ModelAndView model,
						@ModelAttribute Cart cart,
						@RequestParam("list") List<Integer> list,
						@SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		cart.setMno(loginMember.getM_no());
		
		for(int pno : list ) {
			result = cartService.cartDelete(pno, loginMember.getM_no());
		}
		
		System.out.println(result);
		
		if(result > 0) {
			model.addObject("msg", "상품이 삭제되었습니다.");
			model.addObject("location", "/product/product_cart");
		} else {
			model.addObject("msg", "삭제실패했따");
			model.addObject("location", "/product/product_cart");
		}
		model.setViewName("common/msg");

		
		return model;
	}
}
