package com.finalproject.voda.cart.model.service;

import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.voda.cart.model.mapper.CartMapper;
import com.finalproject.voda.cart.model.vo.Cart;
import com.finalproject.voda.common.util.PageInfo;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartMapper cartMapper;

	@Override
	public int insertCart(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.insertCart(cart);
	}

	@Override
	public List<Cart> getCartList(int m_no) {
		// TODO Auto-generated method stub
		return cartMapper.getCartList(m_no);
	}

	@Override
	public int getTotalPrice(List<Cart> cart) {
		int totalPrice = 0;
		for (int i = 0; i < cart.size(); i++) {
			totalPrice += cart.get(i).getPprice();
		} 
		return totalPrice;
	}

	@Override
	public int getTotalOqtt(List<Integer> porderqtt) {
		int totalOqtt = 0;
		for (int i = 0; i < porderqtt.size(); i++) {
			totalOqtt += porderqtt.get(i);
		} 
		return totalOqtt;
	}

	@Override
	public int cartDelete(int pno, int m_no) {
		// TODO Auto-generated method stub
		return cartMapper.cartDelete(pno, m_no);
	}

	@Override
	public Cart getCart(int m_no, int p_no) {
		// TODO Auto-generated method stub
		return cartMapper.selectCart(m_no, p_no);
	}



}
