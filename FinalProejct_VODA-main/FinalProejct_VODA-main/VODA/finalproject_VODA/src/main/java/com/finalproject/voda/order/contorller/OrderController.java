package com.finalproject.voda.order.contorller;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.voda.board.model.vo.Board;
import com.finalproject.voda.cart.model.service.CartService;
import com.finalproject.voda.cart.model.vo.Cart;
import com.finalproject.voda.member.model.vo.Member;
import com.finalproject.voda.order.model.service.OrderService;
import com.finalproject.voda.order.model.vo.Order;
import com.finalproject.voda.order.model.vo.Pay;
import com.finalproject.voda.product.model.service.ProductService;
import com.finalproject.voda.product.model.vo.Product;

import oracle.jdbc.proxy.annotation.Post;

@Controller
@SessionAttributes("loginMember")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;
	@Autowired
	private CartService cartService;
	
	@GetMapping("/product_order")
	public ModelAndView ProductOrder (ModelAndView model,
			@RequestParam int pno,
			@RequestParam int porderqtt) {
		Product product = new Product();
		
		product = productService.findProductByNo(pno);
		product.setPorderqtt(porderqtt);
		product.setPprice(product.getPprice() * porderqtt);
		
		System.out.println(product);
		System.out.println(porderqtt);
		model.addObject("product", product);
		model.setViewName("product/product_order");
		
		return model;
		
	}
	
	@GetMapping("/product_list_order")
	public ModelAndView ProductListOrder (ModelAndView model,
			@ModelAttribute Order order,
			@SessionAttribute("loginMember") Member loginMember,
			@RequestParam List<Integer> porderqtt,
			@RequestParam List<Integer> pnolist) {
		List<Cart> cart = new ArrayList<Cart>();
		String productName = null;
		
//		cart = cartService.getCartList(loginMember.getM_no()); 오류가 나는 이유 >> cart리스트를 만들어서 한 계정의 카트 리스트를 가져오면 카트리스트에는 그 계정의 모든 상품이 들어오게 돼
//		
//		for(int i=0; i<cart.size(); i++){                                   >> 그럼 카트의 사이즈는 db에 저장된, 즉 그 계정의 전체 상품의 갯수가 되는거야 그렇다면 너가 전체 상품을 선택한다면 문제가 없지만
//			cart.get(i).setPno(pnolist.get(i));                             >> 전체 상품을 선택하지 않는다면 jsp에서 가져온 pnolist의 갯수가 카트의 사이즈보다 작아서 index범위를 벗어났나는 에러가 발생해
//			cart.get(i).setPorderqtt(porderqtt.get(i));
//			cart.get(i).setPprice(porderqtt.get(i) * cart.get(i).getPprice());
//		}
		
		for(int i = 0; i < pnolist.size(); i++) {	                      //>>그렇다면 먼저 반복문의 범위를 전체 카트개수가 아닌 체크된 상품리스트 pnolist를 사용해야겠지
			Cart cart1 = cartService.getCart(loginMember.getM_no(), (int)pnolist.get(i)); //>>그리고 카트객체를 하나 만들어서 pno에 해당하는 상품정보를 가져와
			cart1.setPorderqtt(porderqtt.get(i));                                         //>>가져온 상품카트에 구매수량만 set해주면 상품 하나 완성 사실 porderqtt는 구매수량이 아니라 보유수량인데 아닌가?
			cart1.setPprice(porderqtt.get(i) * cart1.getPprice());                          										//>>가져온 상품카트에 구매수량만 set해주면 상품 하나 완성 사실 porderqtt는 구매수량이 아니라 보유수량인데 아닌가?
			
			cart.add(cart1);                                                              //>>완성된 카트 하나를 카트리스트에 추가, 이걸 반복돌려서 카트리스트를 넘겨주면 되는거야
			
		}
	
		
		int totalOqtt = cartService.getTotalOqtt(porderqtt);
		int totalPrice = cartService.getTotalPrice(cart);
		
		productName = cart.get(0).getPname() + " 포함 총 " + totalOqtt + "개의 상품";
		
		model.addObject("cart", cart);
		model.addObject("totalPrice", totalPrice);
		model.addObject("totalOqtt", totalOqtt);
		model.addObject("productName", productName);
		model.setViewName("product/product_list_order");
		
		return model;
		
	}
	
	
	@PostMapping("/order_insert")
	public ModelAndView InsertOrder (ModelAndView model,
			@ModelAttribute Order order,
			@ModelAttribute Pay pay,
			@SessionAttribute("loginMember") Member loginMember) {
//		pay = new Pay();
		int result = 0;
		int payno = 0;
		
		payno = orderService.insertPay(pay);
		
		order.setMno(loginMember.getM_no());
		order.setPayno(payno);
		
		result = orderService.insertOrder(order);
		
		System.out.println(loginMember);
		System.out.println(order);
		System.out.println(payno);
		System.out.println("pay" + pay);
		System.out.println(pay.getPayprice());
		
		if(result  > 0) {
			model.setViewName("mainpage");
		} else {
			model.setViewName("mainpage");
		}
		return model;
	}
	
	@PostMapping("/order_list_insert")
	public ModelAndView ListInsertOrder (ModelAndView model,
			@ModelAttribute Order order,
			@ModelAttribute Pay pay,
			@RequestParam List<Integer> porderqtt,
			@SessionAttribute("loginMember") Member loginMember) {
		List<Cart> cart = new ArrayList<Cart>();
		int result = 0;
		int payno = 0;
		String productName = null;
		
		
		for(int i=0; i<cart.size(); i++){
			cart.get(i).setPorderqtt(porderqtt.get(i));
			cart.get(i).setPprice(porderqtt.get(i) * cart.get(i).getPprice());
			}
		int totalPrice = cartService.getTotalPrice(cart);
		
		cart = cartService.getCartList(loginMember.getM_no());
		
		payno = orderService.insertPay(pay);
		
		order.setMno(loginMember.getM_no());
		order.setPayno(payno);
		
		
		for (int i = 0; i < cart.size(); i++) {
			order.setPno(cart.get(i).getPno());
			order.setOqtt(porderqtt.get(i));
			
			result = orderService.insertOrder(order);
		}
		
		
		

		System.out.println();
		System.out.println(cart);
		
		model.addObject("productName", productName);
		model.addObject("totalPrice", totalPrice);
		model.addObject("cart", cart);
		model.addObject("order", order);
		model.setViewName("mainpage");
		
		if(result  > 0) {
			model.setViewName("mainpage");
		} else {
			model.setViewName("mainpage");
		}
		return model;
	}
	
	
}
