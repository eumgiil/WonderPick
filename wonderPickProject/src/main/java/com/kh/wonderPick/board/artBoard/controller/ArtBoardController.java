package com.kh.wonderPick.board.artBoard.controller;

import java.util.Arrays;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;

@Controller
public class ArtBoardController {

	@Autowired
	private ArtBoardService artService;
	
	@RequestMapping("artList.bo")
	public ModelAndView selectArtList(ModelAndView mv /* int currentPage*/ ) {
		
		
		return mv;
	}
	public String selectArtList( /* int currentPage*/ ) {
		
		return "board/artBoard/detailView";
	} 
	
	@RequestMapping("toGo.at")
	public String abc() {
		return "board/artBoard/goodsEnrollForm";
	}
	
	@RequestMapping("enroll.at")
	public String enrollArtBoard(Board board,
			                     ArtBoard artBoard,
			                     Option options) {
		
		System.out.println(board);
		System.out.println(artBoard);
		System.out.println(options);
		
		artService.enrollArtBoard(board, artBoard, options);
		
		
		
		return null;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
