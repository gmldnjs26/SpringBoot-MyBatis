package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.CartVO;

@Mapper
public interface CartMapper {
	public List<CartVO>getUserCartList(String u_id);
	public CartVO getOneCart(int cseq);
	public void deleteCart(int cseq);
	public void insertCart(Map<String,Object>map);
}
