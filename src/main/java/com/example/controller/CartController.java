package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.ProductVO;
import com.example.dto.UserVO;
import com.example.mapper.CartMapper;
import com.example.mapper.ProductMapper;

@Controller
public class CartController {
	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private ProductMapper productMapper;
	
	@RequestMapping("/cart_insert")
	public String insertCart(@RequestParam String pseq,Model model,
			@RequestParam String quantity,HttpSession session) {
		int pseq2 = Integer.parseInt(pseq);
		int quantity2 = Integer.parseInt(quantity);
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		ProductVO productVO = productMapper.getOneProduct(pseq2);
		Map<String,Object>map = new HashMap<>();
		map.put("u_id", userVO.getU_id());
		map.put("pseq",pseq2);
		map.put("u_name",userVO.getU_name());
		map.put("p_name",productVO.getP_name());
		map.put("quantity", quantity2);
		map.put("p_price",productVO.getP_price());
		model.addAttribute("message", "カートに入れました。");
		cartMapper.insertCart(map);
		
		return "redirect:/index";
	}
	
	@RequestMapping("/cart_list")
	public String getUserCart(HttpSession session,Model model) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("cartList", cartMapper.getUserCartList(userVO.getU_id()));
		return "mypage/cartList";
	}
	
	@RequestMapping("/cart_delete")
	public String deleteCart(@RequestParam String []cseq) {
		for(String s : cseq) {
			int num = Integer.parseInt(s);
			cartMapper.deleteCart(num); // クァーリーを何回飛ばすことなんですけど、、
		}
		return "mypage/cartList";
	}
}
