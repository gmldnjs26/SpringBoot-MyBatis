package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.OrderVO;

@Mapper
public interface OrderMapper {
	public List<OrderVO>getUserOrderList(String u_id);
	public void insertOrder(Map<String,Object>map);
}
