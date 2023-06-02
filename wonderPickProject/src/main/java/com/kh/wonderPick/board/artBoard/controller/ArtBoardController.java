package com.kh.wonderPick.board.artBoard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;

@Controller
public class ArtBoardController {

	@Autowired
	private ArtBoardService artService;
	
	@RequestMapping("artList.bo")
<<<<<<< HEAD
	public ModelAndView selectArtList(ModelAndView mv /* int currentPage*/ ) {
		
		
		return mv;
=======
	public String selectArtList( /* int currentPage*/ ) {
		
		return "board/artBoard/detailView";
		
>>>>>>> 3c04145f09464d5fe73e4238beb3f6e95db58ea7
	} 
	
}
