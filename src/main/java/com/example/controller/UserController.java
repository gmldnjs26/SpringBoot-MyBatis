package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.example.dto.OrderVO;
import com.example.dto.UserVO;
import com.example.mapper.OrderMapper;
import com.example.mapper.ProductMapper;
import com.example.mapper.UserMapper;

@Controller
@SessionAttributes("loginUser")

public class UserController {
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	ProductMapper productMapper;
	
	@RequestMapping("/index")
	public String index(Model model,@RequestParam(required = false) String message) {
		System.out.println("Index Execute");
		model.addAttribute("bestProductList", productMapper.getBestProductList());
		model.addAttribute("newProductList", productMapper.getNewProductList());
		model.addAttribute("message", message);
		return "index";
	}
	
	@RequestMapping("/contract")
	public String constract() {
		System.out.println("Constract Excute");
		return "member/contract";
	}
	
	@RequestMapping("/join_form")
	public String joinForm() {
		return "member/join";
	}
	
	@RequestMapping("/join")
	public String join(UserVO userVO,Model model) {
		userMapper.insertUser(userVO);
		model.addAttribute("message", "会員加入完了！");
		return "index";
	}
	@RequestMapping("/id_check_form")
	public String idCheckForm(Model model,@RequestParam String id) {
		model.addAttribute("id", id);
		return "member/idcheck";
	}
	@RequestMapping("/id_check")
	public String idCheck(Model model,@RequestParam String id) {
		if(userMapper.idCheck(id) != null) 
			model.addAttribute("message", 0);
		else
			model.addAttribute("message", 1);
		model.addAttribute("id", id);
		return "member/idcheck";
	}
	@RequestMapping("/login_form")
	public String login_form() {
		return "member/login";
	}
	@PostMapping("/login")
	public String login(@RequestParam String id, @RequestParam String pwd,Model model) {
		UserVO userVO = userMapper.login(id, pwd);
		if(userVO != null) {
			model.addAttribute("loginUser", userVO);
			return "redirect:/index";
		}else {
			model.addAttribute("message", "存在されてないアカウント");
			return "member/login";
		}
	}
	@GetMapping("/logout")
	public String logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/index";
	}
	@GetMapping("/mypage")
	public String mypage(HttpSession session,Model model) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		List<OrderVO>orderList = orderMapper.getUserOrderList(userVO.getU_id());
		model.addAttribute("orderList", orderList);
		return "mypage/mypage";
	}
	
	
	
}
