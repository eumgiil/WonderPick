package com.kh.wonderPick.board.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String selectList(@RequestParam(value="cPage", defaultValue="1")int currentPage
							,Model model
							,String selectOrder) {
		PageInfo pi = Pagination.getPageInfo(goodsService.selectListCount(), currentPage,12, 10);
		/*
		ArrayList<Heart>heartList = new ArrayList();
		Heart h = new Heart();
		heartList = goodsService.selectHeartList();
		*/
		
		model.addAttribute("pi", pi);
		model.addAttribute("heartList",goodsService.selectHeartList());
		System.out.println(goodsService.selectHeartList());
		model.addAttribute("list", goodsService.selectGoodsList(pi, selectOrder));
		
		return "board/goods/goodsListView";
	}
	
	@RequestMapping("categorylist.go")
	public ModelAndView selectCategoryList(@RequestParam(value="cPage", defaultValue="1")int currentPage, String goodsCategory, ModelAndView mv) {
		PageInfo pi = Pagination.getPageInfo(goodsService.selectCategoryListCount(goodsCategory), currentPage,12, 10);
		System.out.println(pi);
		
		mv.addObject("pi", pi);
		mv.addObject("list", goodsService.selectCategoryList(pi, goodsCategory));
		mv.setViewName("board/goods/goodsCategoryListView");
		
		return mv;
		
	}

	@RequestMapping("detail.go")
	public ModelAndView selectGoods(ModelAndView mv, int boardNo,  HttpSession session) {
		
		
		if(goodsService.increaseCount(boardNo)>0) {
			mv.addObject("g", goodsService.selectGoods(boardNo));
			mv.addObject("bi", goodsService.selectBoardImage(boardNo));
			System.out.println(goodsService.selectBoardImage(boardNo));
			mv.addObject("reviewList", goodsService.selectReviewList(boardNo));
			mv.addObject("replyList", goodsService.selectReplyList(boardNo));
			mv.addObject("heart", goodsService.selectHeart(boardNo));
			System.out.println(goodsService.selectHeart(boardNo));
			mv.setViewName("board/goods/goodsDetailView");
			
		}else {
			mv.addObject("errorMsg", "조회수 증가 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
			
	}

	@RequestMapping("search.go")
	public void searchGoods(@RequestParam(value="cPage", defaultValue="1")int currentPage,
									ModelAndView mv,
									String condition,
									String keyword,
									HttpSession session) {
		HashMap<String, String> map = new HashMap();
		
		map.put("condition", condition);
		map.put("keyword", keyword);
	    System.out.println("안녕 난 컨트롤러얌~히히");
		PageInfo pi = Pagination.getPageInfo(goodsService.searchGoodsCount(map), currentPage,12, 10);
	    System.out.println(pi);
		mv.addObject("pi", pi);
		mv.addObject("list", goodsService.searchGoods(map, pi));
		mv.setViewName("board/goods/goodsListView");

		
		// return mv;
	}
	
	@RequestMapping("enrollForm.go")
	public String enrollForm() {
		return "board/goods/goodsEnrollForm";
	}
	
	/*
	public String saveFile(MultipartFile thumbnailUpFile,  MultipartFile[] upfile, HttpSession session) {
		
		ArrayList<BoardImage>list = new ArrayList();
		
		// 파일명 수정 작업 후 서버에 업로드시키기
		String originName = thumbnailUpFile.getOriginalFilename();
		
		// 년월일시분초
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		// 5자리 랜덤값
		int randomNumber = (int)(Math.random()* 9000 + 10000);
		
		//확장자
		String ext = originName.substring(originName.lastIndexOf("."));
				
		String changeName = currentTime + randomNumber + ext;
		
		// 업로드 시키고자 하는 폴더에 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/goodsFiles/");
		
		try {
			thumbnailUpFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e1) {
			e1.printStackTrace();
		}
		
		
		return changeName;
	}
	*/
	
	@RequestMapping("insert.go")
	public String insertGoods( Board b, Goods g, MultipartFile thumbnailUpFile,  MultipartFile[] upfile, HttpSession session, Model model) {
		
		ArrayList<BoardImage>list = new ArrayList();
		
		String originName = thumbnailUpFile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		int randomNumber = (int)(Math.random() * 9000 + 1000);
		String changeName = currentTime + randomNumber + ext;
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/goodsFiles/");
		try {
			thumbnailUpFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e1) {
			e1.printStackTrace();
		}
		BoardImage boardImage =  new BoardImage();
		boardImage.setOriginName(originName);
		boardImage.setModifyName(b.getBoardTitle());
		boardImage.setFileLevel(1);
		boardImage.setFilePath("resources/boardUpfiles/goodsFiles/" + changeName);
		
		list.add(boardImage);
		
		for(MultipartFile multipartFile : upfile) {
			if(multipartFile.getSize() != 0) {
				
				String originName2 = multipartFile.getOriginalFilename();
				String currentTime2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
				String ext2 = originName2.substring(originName2.lastIndexOf("."));
				int randomNumber2 = (int)(Math.random() * 9000 + 1000);
				String changeName2 = currentTime2 + randomNumber2 + ext2;
				String savePath2 = session.getServletContext().getRealPath("/resources/boardUpfiles/goodsFiles/");
				
				try {
					multipartFile.transferTo(new File(savePath2 + changeName2));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				boardImage =  new BoardImage();
				boardImage.setOriginName(originName2);
				boardImage.setModifyName(b.getBoardTitle());
				boardImage.setFileLevel(2);
				boardImage.setFilePath("resources/boardUpfiles/goodsFiles/" + changeName2);
				
				list.add(boardImage);
				
			}
		}
		
		int result = goodsService.insertGoods(b, list , g);
		
		if(result > 0) {
			
			model.addAttribute("result", result);
			session.setAttribute("alertMsg", "굿즈 상품 등록 성공" );
			return "redirect:list.go?cPage=1";
		}else {
			model.addAttribute("errorMsg", "상품 등록 실패");
			return "redirect:list.go?cPage=1";
		}
	}
	
	@RequestMapping("updateForm.go")
	public ModelAndView updateForm(int boardNo, ModelAndView mv, HttpSession session) {
		mv.addObject("g", goodsService.selectGoods(boardNo));
		System.out.println("안녕 ㅎㅇㅎㅇㅎㅇㅎㅇ");
		System.out.println(goodsService.selectGoods(boardNo));
		mv.addObject("bi", goodsService.selectBoardImage(boardNo));
		mv.setViewName("board/goods/goodsUpdateForm");
		return mv;
	}
	
	@RequestMapping("update.go")
		public String updateGoods(int boardNo, Board b, Goods g, BoardImage bi , MultipartFile reThumbnailUpFile,  MultipartFile[] reUpfile, ModelAndView mv , HttpSession session) {
			
		ArrayList<BoardImage>list = new ArrayList();
		
		
		String originName = reThumbnailUpFile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		int randomNumber = (int)(Math.random() * 9000 + 1000);
		String changeName = currentTime + randomNumber + ext;
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/goodsFiles/");
		try {
			reThumbnailUpFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e1) {
			e1.printStackTrace();
		}
		
		BoardImage boardImage =  new BoardImage();
		
		list.add(boardImage);
		
		
		if(!reThumbnailUpFile.getOriginalFilename().equals("")) {
		  if(boardImage.getOriginName() != null) {
			  new File(session.getServletContext().getRealPath(boardImage.getModifyName())).delete();
		  }
		}
		boardImage.setOriginName(originName);
		boardImage.setModifyName(b.getBoardTitle());
		boardImage.setFileLevel(1);
		boardImage.setFilePath("resources/boardUpfiles/goodsFiles/" + changeName);
		
		
		for(MultipartFile multipartFile : reUpfile) {
			if(multipartFile.getOriginalFilename().equals("")) {
				if(boardImage.getOriginName() != null) {
					  new File(session.getServletContext().getRealPath(boardImage.getModifyName())).delete();
				}
			}
			
			if(multipartFile.getSize() != 0) {
				String originName2 = multipartFile.getOriginalFilename();
				String currentTime2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
				String ext2 = originName2.substring(originName2.lastIndexOf("."));
				int randomNumber2 = (int)(Math.random() * 9000 + 1000);
				String changeName2 = currentTime2 + randomNumber2 + ext2;
				String savePath2 = session.getServletContext().getRealPath("/resources/boardUpfiles/goodsFiles/");
				
				try {
					multipartFile.transferTo(new File(savePath2 + changeName2));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				boardImage =  new BoardImage();
				boardImage.setOriginName(originName2);
				boardImage.setModifyName(b.getBoardTitle());
				boardImage.setFileLevel(2);
				boardImage.setFilePath("resources/boardUpfiles/goodsFiles/" + changeName2);
				
				list.add(boardImage);
				
			}
		}
		
		mv.addObject("bi", goodsService.selectBoardImage(boardNo));
		mv.setViewName("board/goods/goodsUpdateForm");
		
		
		int result = goodsService.updateGoods(b, list , g);
		
		if(result > 0) {
			
			mv.addObject("result", result);
			session.setAttribute("alertMsg", "굿즈 상품 수정 성공" );
			return "redirect:list.go?cPage=1";
		}else {
			mv.addObject("errorMsg", "상품 수정 실패");
			return "redirect:updateForm.go";
		}
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
	public String ajaxInsertReply(Reply r, HttpSession session) {
		
		
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
	/*
	@ResponseBody
	@RequestMapping("selectHeartList.go" )
	public ModelAndView SelectHeartList(int memberNo, HttpSession session,ModelAndView mv) {
		
		mv.addObject("result", goodsService.selectHeartList(memberNo));
		mv.setViewName("board/goods/goodsListView");
		
		
		return mv;
	}
	*/
	/*
	@RequestMapping("selectHeart.go")
	public ModelAndView selectHeart(int memberNo,  HttpSession session, ModelAndView mv) {
		
		
			mv.addObject("heart", goodsService.selectHeart(memberNo));
			System.out.println(goodsService.selectHeart(memberNo));
			mv.setViewName("board/goods/goodsDetailView");
	
		return mv;
	}
	*/
	
	/*
	@ResponseBody
	@RequestMapping(value="updateHeart.go", produces="application/json; charset=UTF-8")
	public String updateHeart(Heart h , HttpSession httpSession, Model model) {
		
		
		int result = goodsService.insertHeart(h);
		
		if(result > 0 ) {
			 model.addAttribute("result", result);
			 
		}
		
	}
	*/
	
	// 댓글 삭제
	@RequestMapping("deleteReply.go")
	public String deleteReply(int replyNo, HttpSession session) {
		if(goodsService.deleteReply(replyNo)>0) {
			session.setAttribute("alertMsg", "댓글 삭제 완료");
			return "redirect:detail.go";
		}else {
			session.setAttribute("errorMsg", "댓글 삭제 실패");
			return "redirect:detail.go";
		}
	}
	
	
	

	

}
