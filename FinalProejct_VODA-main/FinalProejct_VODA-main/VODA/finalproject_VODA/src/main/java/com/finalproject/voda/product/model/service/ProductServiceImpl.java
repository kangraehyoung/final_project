package com.finalproject.voda.product.model.service;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.finalproject.voda.common.util.PageInfo;
import com.finalproject.voda.product.model.mapper.ProductMapper;
import com.finalproject.voda.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductMapper productMapper;

	@Override
	public int getProductAllCount() {
		// TODO Auto-generated method stub
		return productMapper.getProductAllCount();
	}

	@Override
	public List<Product> getProductList(PageInfo pageInfo) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return productMapper.getProductList(rowBounds);
	}

	@Override
	public Product findProductByNo(int pno) {
		// TODO Auto-generated method stub
		return productMapper.findProductByNo(pno);
	}

	@Override
	@Transactional
	public int insertProduct(Product product) {
		int result = 0;
		result =  productMapper.insertProduct(product);
		return result;
	}

	@Override
	public int deleteProduct(int pno) {
		int result = 0;
		result = productMapper.deleteProduct(pno);
		return result;
	}

	@Override
	@Transactional
	public int updateProduct(Product product) {
		int result = 0;
		result = productMapper.updateProduct(product);
		return result;
	}

	@Override
	public int getProductSearchCount(String searchtype, String searchname) {
		// TODO Auto-generated method stub
		return productMapper.getProductSearchCount(searchtype, searchname);
	}

	@Override
	public List<Product> getProductSearchList(PageInfo pageInfo, String searchtype, String searchname) {
		int offset = (pageInfo.getCurrentPage() - 1) * pageInfo.getListLimit();
		int limit = pageInfo.getListLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return productMapper.getProductSearchList(rowBounds, searchtype, searchname);
	}

	@Override
	public Product findProductByNo(int pno, boolean hasRead) {
		return productMapper.findProductByNo(pno);
	}



}
