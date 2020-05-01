package com.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.UserVO;

@Mapper
public interface UserMapper {
	public List<UserVO> findAll();
	public void insertUser(UserVO userVO);
	public UserVO idCheck(String id);
	public UserVO login(String id, String pwd);
}