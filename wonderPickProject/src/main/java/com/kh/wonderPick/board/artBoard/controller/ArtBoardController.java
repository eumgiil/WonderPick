package com.kh.wonderPick.board.artBoard.controller;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.controller.BoardController;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.common.template.Pagination;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class ArtBoardController {
	
	@Autowired
	private ArtBoardService artService;
	
	@RequestMapping("artList.bo")
	public ModelAndView selectArtList(ModelAndView mv, @RequestParam(value="cPage", defaultValue="1") int currentPage) {
		
		// 페이징 처리 등 해야함
		PageInfo pi = Pagination.getPageInfo(artService.selectArtListCount(), currentPage, 12, 10);
		System.out.println(artService.selectArtList(pi));
		mv.addObject("pi", pi).addObject("list", artService.selectArtList(pi)).setViewName("board/artBoard/artListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.at")
	public String abc() {
		return "board/artBoard/artEnrollForm";
	}
	
	@RequestMapping("insertBoard.at")
	public ModelAndView enrollArtBoard(Board board,
									   ArtBoard artBoard,
									   String[] options,
									   MultipartFile[] upFile,
									   HttpSession session,
									   HttpServletRequest request,
									   ModelAndView mv) {
		
		ArrayList<Option> list = new ArrayList();
		
		for(int i = 1; i <= options.length; i++) {
			Option detailOp = new Option();
			detailOp.setMainOp(request.getParameter("option_" + i));
			detailOp.setDetail(
					Arrays.toString(request.getParameterValues("detailOp" + i)));
			detailOp.setPrice(
					Arrays.toString(request.getParameterValues("opPrice" + i)));
			
			list.add(detailOp);
		}
		
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/artBoardFiles/");
		ArrayList<BoardImage> files = new BoardController().saveFile(upFile, session, savePath);
		
		
		int result = artService.insertArtBoard(board, artBoard, list, files);
		
		if(result > 0) {
			mv.addObject("alertMsg", "업로드 성공").setViewName("board/artBoard/request_list");
		} else {
			mv.addObject("alertMsg", "업로드 실패").setViewName("board/artBoard/request_list");
		}
		return mv;
	}
	
//	@RequestMapping("artDetail.bo")
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
