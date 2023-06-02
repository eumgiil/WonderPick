package com.kh.wonderPick.board.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
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
		
		return "board/goods/goodsListView";
	}
	
	@RequestMapping("enrollForm.go")
	public String enrollForm() {
		return "goods/goodsEnrollForm";
	}
	
	public String saveFile(MultipartFile upfile, HttpSession session) {
		// 파일명 수정 작업 후 서버에 업로드시키기
		String originName = upfile.getOriginalFilename();
		
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int ranNum = (int)(Math.random()* 90000 + 10000);
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
				
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더에 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/");
		
				
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
	@RequestMapping("insert.bo")
	public String insertGoods(Goods g, Board b, BoardImage bi, MultipartFile upfile, HttpSession session, Model model) {
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			bi.setOriginName(upfile.getOriginalFilename());
			bi.setModifyName("resources/boardUpfiles/" + saveFile(upfile, session));
		}
		if(goodsService.insertGoods(g)>0) {
			session.setAttribute("alertMsg", "상품 등록 성공!");
			return "redirect:list.go";
		}else {
			model.addAttribute("errorMsg","상품등록 실패");
			return "common/errorPage";
		}
	}

}
