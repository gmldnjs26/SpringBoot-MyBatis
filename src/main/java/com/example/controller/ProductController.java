package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mapper.ProductMapper;

@Controller
public class ProductController {
	@Autowired
	ProductMapper productMapper;
	
	@GetMapping("/product_detail")
	public String getOneProduct(Model model, @RequestParam String pseq) {
		System.out.println("ProductDetail Execute");
		int pseq2 = Integer.parseInt(pseq);
		model.addAttribute("productVO", productMapper.getOneProduct(pseq2));
		return "product/productDetail";
	}
}
