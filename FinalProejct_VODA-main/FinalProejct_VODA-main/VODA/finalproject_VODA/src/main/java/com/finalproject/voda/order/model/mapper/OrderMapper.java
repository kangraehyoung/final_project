package com.finalproject.voda.order.model.mapper;

import com.finalproject.voda.order.model.vo.Order;
import com.finalproject.voda.order.model.vo.Pay;

public interface OrderMapper {

	Order findOrderByNo(int pno);

	int insertOrder(Order order);

	int insertPay(Pay pay);

}
