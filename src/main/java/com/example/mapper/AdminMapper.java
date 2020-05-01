package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.OrderVO;
import com.example.dto.ProductVO;
import com.example.dto.QnaVO;
import com.example.dto.UserVO;

import utils.CriteriaVO;

@Mapper
public interface AdminMapper {
	// --------------------------User--------------------------------//
	public List<UserVO>getAllUserList();
	public List<UserVO>getSearchUserList(String key);
	
	
	// --------------------------Qna--------------------------------//
	public List<QnaVO>getAllQnaList();
	public void updateQna(Map<String,Object>map);
	
	
	// -------------------------Order--------------------------------//
	public List<OrderVO>getAllOrderList();
	public void updateOrder(int oseq);
	
	
	// ------------------------Product-------------------------------//
	public List<ProductVO>getAllProductList();
	public int totalCount();
	public List<ProductVO>getProductList(CriteriaVO cri);

	
	
	
	
	
}
