package com.example.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dto.ProductVO;
import com.example.mapper.AdminMapper;
import com.example.mapper.QnaMapper;

import utils.CriteriaVO;
import utils.PageMaker;

@Controller
@SessionAttributes("admin")
public class AdminController {
	@Autowired
	AdminMapper adminMapper;
	@Autowired
	QnaMapper qnaMapper;
	
	
	@RequestMapping("/admin_login_form")
	public String adminLoginForm() {
		return "admin/adminLogin";
	}
	
	@RequestMapping("/admin_login")
	public String adminLoginForm(@RequestParam String id,@RequestParam String pwd,Model model) {
		if(id.equals("admin") && pwd.equals("1234")) {
			model.addAttribute("admin", id);
			return "admin/index";
		}
		model.addAttribute("message", "もう一度正確に入力して下さい。");
		return "admin/adminLogin";
	}
	// -----------------------Product--------------------------------//
	@RequestMapping("/admin_product_list")
	public String adminProductList(Model model, @RequestParam(required = false) String page) {
		CriteriaVO cri = new CriteriaVO();
		if(page != null)
			cri.setPage(Integer.parseInt(page));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(adminMapper.totalCount());
		model.addAttribute("productList", adminMapper.getProductList(cri));
		model.addAttribute("pageMaker", pageMaker);
		return "admin/product/productList";
	}
	@RequestMapping("/admin_product_write_form")
	public String adminProductWriteForm(Model model) {
		model.addAttribute("kindList", utils.ProductKind.values());
		return "admin/product/productWrite";
	}
	
	@RequestMapping("/admin_product_write")
	public String adminProductWrite(ProductVO productVO, 
			@RequestParam MultipartFile product_image,HttpServletRequest request) {
		String path = "C:\\Gwak2";
		System.out.println(path);
		System.out.println(productVO.getP_content());
		System.out.println(product_image.getOriginalFilename());
		try {
			File file = new File(path + "/" + product_image.getOriginalFilename());
			BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(path));
			byte[] bytes = product_image.getBytes();
			bs.write(bytes);
			bs.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "admin_product_list";
	}
	
	// -------------------------Order--------------------------------//
	@RequestMapping("/admin_order_list")
	public String adminOrderList(Model model) {
		model.addAttribute("orderList",adminMapper.getAllOrderList());
		return "admin/order/orderList";
	}
	@RequestMapping("/admin_update_order")
	public String adminUdpateOrder(@RequestParam(required = false) String[] result,
			RedirectAttributes redirectAttrs) {
		if(result != null) {
			System.out.println("nullじゃない");
			for(String s : result) {
				int oseq = Integer.parseInt(s);
				adminMapper.updateOrder(oseq);
			}
			redirectAttrs.addAttribute("message", "処理完了");
		}
		return "redirect:/admin_order_list";
	}
	
	
	// -------------------------User--------------------------------//
	@RequestMapping("/admin_user_list")
	public String adminUserList(Model model, @RequestParam(required = false)String key ) {
		if(key != null) 
			model.addAttribute("userList", adminMapper.getSearchUserList(key));
		else
			model.addAttribute("userList", adminMapper.getAllUserList());
		return "admin/member/memberList";
	}
	
	// --------------------------Qna-------------------------------//
	@RequestMapping("/admin_qna_list")
	public String adminQnaList(Model model) {
		model.addAttribute("qnaList", adminMapper.getAllQnaList());
		return "admin/qna/qnaList";
	}
	@RequestMapping("/admin_qna_view")
	public String adminQnaView(Model model,@RequestParam String qseq) {
		int qseq2 = Integer.parseInt(qseq);
		model.addAttribute("qnaVO", qnaMapper.getOneQna(qseq2));
		return "admin/qna/qnaDetail";
	}
	@RequestMapping("/admin_qna_repsave")
	public String adminQnaRepsave(Model model,@RequestParam String q_reply,@RequestParam String qseq) {
		int qseq2 = Integer.parseInt(qseq);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("qseq",qseq2);
		map.put("q_reply", q_reply);
		adminMapper.updateQna(map);
		return "admin/qna/qnaList";
	}

}
