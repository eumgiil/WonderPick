package com.kh.wonderPick.board.contestBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.board.contestBoard.model.service.ContestService;

@Controller
public class ContestController {
	
	@Autowired
	private ContestService contestService;
	
	@RequestMapping("selectTop10.ct")
	public String selectTop10(Model model) {
		
		model.addAttribute("list",contestService.selectTop10());
		
		return "board/contestBoard/contestMain";
		
	}
	
	@RequestMapping("enrollForm.ct")
	public String contestEnrollForm() {
		return "board/contestBoard/contestEnrollForm";
	}
	
	@RequestMapping("insertContest.ct")
	public String insertContest() {
		
		
		return "board/contestBoard/contestMain";
	}
	

}
