package com.finalproject.voda.product.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import com.finalproject.voda.product.model.vo.Product;

public interface ProductMapper {

	int getProductAllCount();

	List<Product> getProductList(RowBounds rowBounds);

	Product findProductByNo(int pno);

	int insertProduct(Product product);

	int deleteProduct(int pno);

	int updateProduct(Product product);

	int getProductSearchCount(@Param("searchtype") String searchtype,@Param("searchname") String searchname);

	List<Product> getProductSearchList(RowBounds rowBounds,@Param("searchtype") String searchtype,@Param("searchname") String searchname);

	int updateProductView(Product product);


}
