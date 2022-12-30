package com.finalproject.voda.product.model.service;

import java.util.List;

import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.product.model.vo.Product;

public interface ProductService {

	int getProductAllCount();

	List<Product> getProductList(PageInfo pageInfo);

	Product findProductByNo(int pno);

	int insertProduct(Product product);

	int deleteProduct(int pno);

	int updateProduct(Product product);

	int getProductSearchCount(String searchtype, String searchname);

	List<Product> getProductSearchList(PageInfo pageInfo, String searchtype, String searchname);

	Product findProductByNo(int pno, boolean hasRead);


	
}
