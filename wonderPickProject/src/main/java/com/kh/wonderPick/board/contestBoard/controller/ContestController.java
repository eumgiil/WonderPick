package com.kh.wonderPick.board.contestBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.wonderPick.board.contestBoard.model.service.ContestService;

@Controller
public class ContestController {
	
	@Autowired
	private ContestService contestService;
	
	@RequestMapping("contestMain.ct")
	public String selectMain() {
		
		contestService.selectMain();
		return "board/contestBoard/contestMain";
	}
	
	

}
