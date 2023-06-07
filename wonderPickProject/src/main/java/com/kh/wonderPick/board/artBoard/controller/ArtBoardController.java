package com.kh.wonderPick.board.artBoard.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOp;
import com.kh.wonderPick.board.artBoard.model.vo.MainOption;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;

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
			                     DetailOp detailOp,
			                     MainOption mainOption,
			                     BoardImage boardImg,
			                     MultipartFile[] upfile,
			                     HttpSession session,
			                     Model model) {
		
//		System.out.println(board);
//		System.out.println(artBoard);
//		System.out.println(detailOp);
//		System.out.println(mainOption);
		System.out.println(Arrays.toString(upfile));
		
		
		
		
		
		
		return null;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
