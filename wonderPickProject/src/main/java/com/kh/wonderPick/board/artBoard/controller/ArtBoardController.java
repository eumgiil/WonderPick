package com.kh.wonderPick.board.artBoard.controller;

import org.springframework.stereotype.Controller;

@Controller
public class ArtBoardController {

	@Autowired
	private ArtBoardService artService;
	
	@RequestMapping("artList.bo")
	public String selectArtList( /* int currentPage*/ ) {
		
		return "board/artBoard/detailView";
		
	} 
	
}
