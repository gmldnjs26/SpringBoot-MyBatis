package com.example;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import com.example.dto.UserVO;
import com.example.mapper.UserMapper;

@RunWith(SpringRunner.class)
@SpringBootTest
public class GshopApplicationTests {
	@Autowired
	private UserMapper mapper;

	@Test
	public void contextLoads() {
	}
	
	@Test
	public void mapperTest() {
		UserVO userVO = new UserVO();
		mapper.insertUser(userVO);
		
	}
	

}
