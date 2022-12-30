package com.finalproject.voda.cart.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.finalproject.voda.cart.model.vo.Cart;
import com.finalproject.voda.common.util.PageInfo;

public interface CartMapper {

	int insertCart(Cart cart);

	List<Cart> getCartList(@Param("mno") int m_no);

	int cartDelete(@Param("pno") int pno,@Param("mno") int m_no);

	Cart selectCart(@Param("m_no")int m_no, @Param("p_no")int p_no);

}
