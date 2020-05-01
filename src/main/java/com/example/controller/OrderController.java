package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.CartVO;
import com.example.dto.UserVO;
import com.example.mapper.CartMapper;
import com.example.mapper.OrderMapper;

@Controller
public class OrderController {
	@Autowired
	CartMapper cartMapper;
	
	@Autowired
	OrderMapper orderMapper;
	
	@RequestMapping("/order_insert")
	public String insertOrder(@RequestParam String []cseq,HttpSession session,
			RedirectAttributes redirectAttrs) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		for(String s : cseq) {
			Map<String,Object>map = new HashMap<String,Object>();
			CartVO cartVO = cartMapper.getOneCart(Integer.parseInt(s));
			map.put("u_id", userVO.getU_id());
			map.put("zip_num",userVO.getZip_num());
			map.put("address",userVO.getAddress());
			map.put("phone",userVO.getPhone());
			map.put("pseq",cartVO.getPseq());
			map.put("p_name",cartVO.getP_name());
			map.put("quantity",cartVO.getQuantity());
			map.put("p_price",cartVO.getP_price());
			map.put("u_name",userVO.getU_name());
			orderMapper.insertOrder(map);
			cartMapper.deleteCart(cartVO.getCseq());
		}
		redirectAttrs.addAttribute("message", "注文完了");
		return "redirect:/index";
	}
}
