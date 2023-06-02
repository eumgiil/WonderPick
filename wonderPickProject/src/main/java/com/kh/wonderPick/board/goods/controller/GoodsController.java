package com.kh.wonderPick.board.goods.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.goods.model.service.GoodsService;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.common.template.Pagination;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("list.go")
	public String selectList(@RequestParam(value="cPage", defaultValue="1")int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(goodsService.selectListCount(), currentPage, 5, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", goodsService.selectGoodsList(pi));
		
		return "goods/goodsListView";
	}
	
	@RequestMapping("enrollForm.go")
	public String enrollForm() {
		return "goods/goodsEnrollForm";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 파일명 수정 작업 후 서버에 업로드시키기
		String originName = upfile.getOriginalFilename();
	}
	@RequestMapping("insert.bo")
	public String insertGoods(Goods g, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			BoardImage bi = new BoardImage();
			
			bi.setOriginName(upfile.getOriginalFilename());
			bi.setModifyName("resources/uploadFiles/" + saveFile(upfile, session));
			
			
		}
	}

}
