package com.finalproject.voda.cart.model.service;

import java.util.List;

import com.finalproject.voda.cart.model.vo.Cart;
import com.finalproject.voda.common.util.PageInfo;

public interface CartService {

	int insertCart(Cart cart);

	List<Cart> getCartList(int m_no);

	int getTotalPrice(List<Cart> cart);

	int getTotalOqtt(List<Integer> porderqtt);

	int cartDelete(int pno, int m_no);

	Cart getCart(int m_no, int p_no);


	

	

}
