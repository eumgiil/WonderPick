package com.kh.wonderPick.board.artBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

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
	public void enrollArtBoard(HttpServletRequest request, int count) {
		
		ArrayList list = new ArrayList();
//		String[] a = request.getParameterValues("a");
		
		int length;
		
		for(int i = 0; i < count; i++) {
			list.add(request.getParameterValues("detailOp" + i));
		}
		System.out.println(list);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
