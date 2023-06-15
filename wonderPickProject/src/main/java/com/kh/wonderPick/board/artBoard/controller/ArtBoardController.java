package com.kh.wonderPick.board.artBoard.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;
import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardDetailContent;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.reply.model.service.ReplyService;
import com.kh.wonderPick.board.review.model.service.ReviewService;
import com.kh.wonderPick.board.review.model.vo.Review;
import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.common.template.Pagination;

@Controller
public class ArtBoardController {
	@Autowired
	private ArtBoardService artService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReplyService replyService;
	
	
	
	
	
	
	@RequestMapping("artList.bo")
	public ModelAndView selectArtList(ModelAndView mv, @RequestParam(value="cPage", defaultValue="1") int currentPage) {
		
		// 페이징 처리 등 해야함
		PageInfo pi = Pagination.getPageInfo(artService.selectArtListCount(), currentPage, 12, 10);
		System.out.println(artService.selectArtList(pi));
		mv.addObject("pi", pi).addObject("list", artService.selectArtList(pi)).setViewName("board/artBoard/artListView");
		return mv;
	}
	
	@RequestMapping("enrollForm.at")
	public String toEnroll() {
		return "board/artBoard/artEnrollForm";
	}
	
	@RequestMapping(value="insertBoard.at" /*, produces = "application/json;charset=UTF-8"*/)
	public void enrollArtBoard(Board board,
							   ArtBoard artBoard,
							   String[] options,
							   MultipartFile[] upFile,
							   HttpSession session,
							   HttpServletRequest request,
							   Model model) {
		
		ArrayList<BoardDetailContent> contentList = new ArrayList();
		
		String boardContent = request.getParameter("boardContent");
		String escapedJson = StringEscapeUtils.unescapeHtml5(boardContent);
		new JsonReader().
		JsonElement jsonElement = JsonParser.parseReader​(jsonReader);
		
		System.out.println("boardContent : " + boardContent);

		boardContent.replaceAll("\\[", "");
		boardContent.replaceAll("\\]", "");
		
		System.out.println("boardContent : " + boardContent);
		
		JsonObject total  = JsonParser.parseString(boardContent).getAsJsonObject();
		System.out.println("total : " + total);
		
		
//		JsonArray totaArr = JsonParser.parseString("json").getAsJsonArray();
//		System.out.println("totaArr : " + totaArr);
//		System.out.println("totalObj : " + totalObj);
//		
//		JsonArray itemArr = totalObj.getAsJsonArray("json");
//		System.out.println("itemArr : " + itemArr);
		
		
//		for(int i = 0; i < itemArr.size(); i++) {
//			BoardDetailContent boardDetailContent = new BoardDetailContent();
//			JsonObject item = itemArr.get(i).getAsJsonObject();
//			
//			
//		}
			
		/*
		 * boardContent를 받고 img src속성만 빼서 saveFile에 보낸 뒤
		 * 
		 * 
		 * 
		 * text일 경우 data를 뿌려주고
		 * img일 경우 
		 * 
		 * 			
		 */
		
		
		
		
		
		
		
//		ArrayList<Option> list = new ArrayList(); // VO들이 담긴 객체
//		for(int i = 1; i <= options.length; i++) {
//			Option option = new Option();
//			ArrayList<DetailOption> detailList = new ArrayList();
//			option.setMainOp(request.getParameter("option_" + i));
//			for(int j = 0; j < request.getParameterValues("detailOp" + i).length; j++) {
//				DetailOption detailOption = new DetailOption();
//				detailOption.setDetail(request.getParameterValues("detailOp" + i)[j]);
//				detailOption.setPrice(request.getParameterValues("opPrice" + i)[j]);
//				detailList.add(detailOption);
//			}
//			option.setDetailOption(detailList);
//			list.add(option);
//		}
//		
//		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/artBoardFiles/");
//		String folderPath = "resources/boardUpfiles/artBoardFiles/";
//		
//		ArrayList<BoardImage> files = new BoardController().saveFile(upFile, session, savePath, folderPath);
//		
//		// 로그인 나오면 지울 부
//		Member loginUser = new Member();
//		loginUser.setMemberNo(1);
//		session.setAttribute("loginUser", loginUser);
//		// 지울 부분 끝
//		
//		board.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
//		int result = artService.insertArtBoard(board, artBoard, list, files);
//		if(result > 0) {
//			model.addAttribute("alertMsg", "업로드 성공");
//		} else {
//			model.addAttribute("alertMsg", "업로드 실패");
//		}
//		return "redirect:artList.bo";
	}
	
	@RequestMapping(value="artDetail.bo")
	public ModelAndView artDetail(ModelAndView mv, int bno) {
//		board 완
//		artBoard 완료
		
//		boardImage 완료
		
//		member
//		memberImage
		
//		review 완료
		
//		reply
//		re_reply
		
		
		ArtBoard artBoard = artService.selectArtBoard(bno);
		ArrayList<Option> optionList = artService.selectOptionList(bno);
		System.out.println(optionList.toString());
		
//		for(int i = 0; i < optionList.size(); i ++) {
//			String detail = optionList.get(i).getDetail();
//			detail.replaceAll(" ", "");
//			detail.replaceAll("\\p{Z}", "");
//			detail.split(",");
//			String[] detailArr = detail.split(",");
//			
//			String price = optionList.get(i).getPrice();
//			detail.replaceAll(" ", "");
//			detail.replaceAll("\\p{Z}", "");
//			detail.split(",");
//			String[] detailArr = detail.split(",");
//		}
		
		ArrayList<BoardImage> boardImage = artService.selectBoardImage(bno);
		ArrayList<Review> reviewList = reviewService.selectBoardReviewList(bno);
		
		
		
		// 이 부분 따로 빼는거 상의해야함
//		ArrayList<Reply1> replyList = replyService.selectReplyList(bno);
		
		mv.addObject("artBoard", artBoard)
		  .addObject("optionList", optionList)
		  .addObject("boardImage", boardImage)
		  .addObject("reviewList", reviewList)
//		  .addObject("replyList", replyList)
//		  .addObject("member", member)
//		  .addObject("memberImage", rmemberImage)
		  .setViewName("board/artBoard/artDetailView");
		return mv;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
