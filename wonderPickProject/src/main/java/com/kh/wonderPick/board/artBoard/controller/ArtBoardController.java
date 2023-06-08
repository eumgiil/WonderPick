package com.kh.wonderPick.board.artBoard.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
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
			                     String[] options,
			                     MultipartFile[] upfile,
			                     HttpServletRequest request,
			                     HttpSession session,
			                     Model model) {
		
		ArrayList<DetailOp> list = new ArrayList();
		BoardImage boardImg = new BoardImage();
		for(int i = 1; i <= options.length; i++) {
			
//			list.add(request.getParameterValues("detailOp" + i));
			
			DetailOp detailOp = new DetailOp();
			
			detailOp.setDeList(request.getParameterValues("detailOp" + i));
			detailOp.setPrList(request.getParameterValues("opPrice" + i));
			detailOp.setOptions(request.getParameter("option_" + i));
			
			list.add(detailOp);
		}
		
		int result = artService.insertArtBoard(board, artBoard, /* boardImg,*/ list);
		System.out.println(result);
//		artService.insertArtBoard(board, artBoard, detailOp, mainOption, boardImg);
		
		
		
		
		
		
		return null;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
