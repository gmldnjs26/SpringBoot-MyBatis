package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.ProductVO;

@Mapper
public interface ProductMapper {
	public List<ProductVO>getBestProductList();
	public List<ProductVO>getNewProductList();
	public ProductVO getOneProduct(int pseq);
}
