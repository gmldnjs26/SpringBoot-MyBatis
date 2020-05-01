package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dto.UserVO;
import com.example.mapper.QnaMapper;

@Controller
public class QnaController {
	@Autowired
	QnaMapper qnaMapper;
	
	@RequestMapping("/qna_list")
	public String getUserQnaList(Model model,HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		model.addAttribute("qnaList", qnaMapper.getUserQnaList(userVO.getU_id()));
		return "qna/qnaList";
	}
	@RequestMapping("/qna_view")
	public String qnaView(Model model,@RequestParam String qseq) {
		int qseq2 = Integer.parseInt(qseq);
		model.addAttribute("qnaVO", qnaMapper.getOneQna(qseq2));
		return "qna/qnaView";
	}
	@RequestMapping("/qna_write_form")
	public String qnaWriteForm() {
		return "qna/qnaWrite";
	}
	
	@RequestMapping("/qna_write")
	public String qnaWrite(@RequestParam String q_subject, @RequestParam String q_content,HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("loginUser");
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("q_subject", q_subject);
		map.put("q_content", q_content);
		map.put("u_id", userVO.getU_id());
		qnaMapper.insertQna(map);
		return "redirect:/qna_list";
		
	}
}
