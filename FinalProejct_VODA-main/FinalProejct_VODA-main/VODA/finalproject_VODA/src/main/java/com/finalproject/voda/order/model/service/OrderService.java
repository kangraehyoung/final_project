package com.finalproject.voda.order.model.service;

import com.finalproject.voda.order.model.vo.Order;
import com.finalproject.voda.order.model.vo.Pay;

public interface OrderService {

	Order findOrderByNo(int pno);

	int insertOrder(Order order);

	int insertPay(Pay pay);

}
