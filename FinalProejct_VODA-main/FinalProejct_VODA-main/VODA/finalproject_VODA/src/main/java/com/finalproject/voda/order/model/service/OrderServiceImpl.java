package com.finalproject.voda.order.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.voda.order.model.mapper.OrderMapper;
import com.finalproject.voda.order.model.vo.Order;
import com.finalproject.voda.order.model.vo.Pay;
@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public Order findOrderByNo(int pno) {
		// TODO Auto-generated method stub
		return orderMapper.findOrderByNo(pno);
	}

	@Override
	public int insertOrder(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.insertOrder(order);
	}

	@Override
	public int insertPay(Pay pay) {
		orderMapper.insertPay(pay);
		System.out.println(pay);
		return pay.getPayno();
	}

}
