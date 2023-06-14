package com.kh.wonderPick.board.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
import com.kh.wonderPick.board.boardCommon.model.vo.Re_Reply;
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
import com.kh.wonderPick.board.goods.model.service.GoodsService;
import com.kh.wonderPick.board.goods.model.vo.Goods;
import com.kh.wonderPick.board.review.model.vo.Review;
import com.kh.wonderPick.common.template.Pagination;
import com.google.gson.Gson;

@Controller
public class GoodsController {
	
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping("list.go")
	public String selectList(@RequestParam(value="cPage", defaultValue="1")int currentPage, Model model) {
		PageInfo pi = Pagination.getPageInfo(goodsService.selectListCount(), currentPage,12, 10);
		
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", goodsService.selectGoodsList(pi));
		
	
		
		return "board/goods/goodsListView";
	}
	
	@RequestMapping("enrollForm.go")
	public String enrollForm() {
		return "board/goods/goodsEnrollForm";
	}
	@RequestMapping("categorylist.go")
	public String selectCategoryList(@RequestParam(value="cPage", defaultValue="1")int currentPage, String goodsCategory, Model model) {
		PageInfo pi = Pagination.getPageInfo(goodsService.selectCategoryListCount(goodsCategory), currentPage,12, 10);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", goodsService.selectCategoryList(pi, goodsCategory));
		
		return "board/goods/goodsCategoryListView";
		
	}
	/*
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
	*/
	@RequestMapping("insert.go")
	public String insertGoods(Goods g, Board b, BoardImage bi, MultipartFile[] upfile, HttpSession session, Model model) {
		/*
		for(int i=1; i<=4; i++) {
			String key = "file" + i;
		
			
			if(upfile.getOriginalFilename(key) != null) {
				
				
				bi.setOriginName(upfile.getOriginalFilename(key));
				bi.setModifyName("resources/boardUpfiles/" + saveFile(upfile, session));
				
				if( i == 1) {
					bi.setFileLevel(1);
				}else{
					bi.setFileLevel(2);
				}
			}
		}
		*/
		System.out.println(upfile);
		for(MultipartFile multipartFile : upfile) {
			// 파일명 수정 작업 후 서버에 업로드시키기("bono.png" => 2023.5.1934235345.png)
			String originName = multipartFile.getOriginalFilename();
			//System.out.println(originName);
			
			// 년월일시분초
			String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
			
			// 5자리 랜덤값
			int randomNumber = (int)(Math.random() * 90000 + 10000);
			
			//확장자
			//System.out.println(originName.lastIndexOf("."));
			//String ext = originName + originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + randomNumber ;
			
			// 업로드 시키고자 하는 폴더에 물리적인 경로 알아내기
			String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/");
			
			try {
				multipartFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			bi.setOriginName(multipartFile.getOriginalFilename());
			bi.setModifyName("/resources/boardUpfiles/");
			
			System.out.println(bi.getOriginName());
			
		
	}
		if(goodsService.insertGoods(g, b, bi)>0) {
			session.setAttribute("alertMsg", "상품 등록 성공!");
			return "board/goods/list.go?cPage=1";
		}else {
			model.addAttribute("errorMsg","상품등록 실패");
			return "board/goods/list.go?cPage=1";
		}
		
	}
	
	@RequestMapping("detail.go")
	public ModelAndView selectGoods(ModelAndView mv, int boardNo,   HttpSession session) {
		
		if(goodsService.increaseCount(boardNo)>0) {
			mv.addObject("g", goodsService.selectGoods(boardNo));
			mv.addObject("reviewList", goodsService.selectReviewList(boardNo));
			mv.addObject("replyList", goodsService.selectReplyList(boardNo));
			mv.setViewName("board/goods/goodsDetailView");
			
		}else {
			mv.addObject("errorMsg", "조회수 증가 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
		
		
		
	}
	
	// 댓글
	@ResponseBody
	@RequestMapping(value="rlist.go", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int boardNo, ModelAndView mv, HttpSession session) {
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		Reply reply = new Reply();
		replyList.add(reply);
		return new Gson().toJson(goodsService.selectReplyList(boardNo));
	}
	@ResponseBody
	@RequestMapping("rinsert.go")
	public String ajaxInsertReply(Reply r) {
		System.out.println(r);
		return goodsService.insertReply(r) > 0 ? "success" : "fail";
		
	}
	
	//대댓글
	@ResponseBody
	@RequestMapping(value="relist.go", produces="application/json; charset=UTF-8")
	public String ajaxSelectReReplyList(int replyNo, int boardNo, ModelAndView mv, HttpSession session) {
		System.out.println("dfkdfkdajf;djf");
		if(goodsService.selectReplyListCount(boardNo) > 0 ) {
			System.out.println(goodsService.selectReplyListCount(boardNo));
			mv.addObject("reReplyList", goodsService.selectReReplyList(replyNo));
			mv.setViewName("board/goods/goodsDetailView");
		}
		
		return new Gson().toJson(goodsService.selectReReplyList(replyNo));
	}
	
	
	@ResponseBody
	@RequestMapping("reinsert.go")
	public String ajaxInsertReReply(Re_Reply re) {
		return goodsService.insertReReply(re) > 0 ? "success" : "fail";
	}
	
	// 회원별 좋아요 조회
	@ResponseBody
	@RequestMapping(value="selectHeart.go", produces="application/json; charset=UTF-8" )
	public String ajaxSelectHeartList(int memberNo) {
		return new Gson().toJson(goodsService.selectHeartList(memberNo));
	}
	
	

	@RequestMapping("updateForm.go")
	public ModelAndView updateForm(int boardNo, ModelAndView mv) {
		mv.addObject("g", goodsService.selectGoods(boardNo)).setViewName("board/goods/goodsUpdateForm");
		return mv;
	}
	@RequestMapping("update.go")
	public String updateGoods(@ModelAttribute Goods g, Board b, BoardImage bi,  MultipartFile[] reUpfile, HttpSession session) {
		
  for(MultipartFile multipartFile : reUpfile) {
			
			String originName = multipartFile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
			
			int randomNumber = (int)(Math.random() * 90000 + 10000);
			
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + randomNumber + ext;
			
			
			String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/");
			
			try {
				multipartFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			bi.setOriginName(multipartFile.getOriginalFilename());
			bi.setModifyName("/resources/boardUpfiles/");
			
			System.out.println(bi.getOriginName());
			
		
	}
		if(goodsService.insertGoods(g, b, bi)>0) {
			session.setAttribute("alertMsg", "상품 수정 성공!");
			return "redirect:list.go";
		}else {
			session.setAttribute("errorMsg","상품 수정 실패");
			return "common/errorPage";
		}
	}
	

}
