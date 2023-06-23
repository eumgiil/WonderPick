package com.kh.wonderPick.board.artBoard.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.wonderPick.board.artBoard.model.service.ArtBoardService;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOption;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.artBoard.model.vo.SearchArt;
import com.kh.wonderPick.board.boardCommon.controller.BoardController;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.reply.model.service.ReplyService;
import com.kh.wonderPick.board.review.model.service.ReviewService;
import com.kh.wonderPick.common.model.vo.PageInfo;
import com.kh.wonderPick.common.template.Pagination;
import com.kh.wonderPick.member.model.vo.Member;

@Controller
public class ArtBoardController {
	@Autowired
	private ArtBoardService artService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ReplyService replyService;
	
	
	
	
	
	
	@RequestMapping("artList.bo")
	public ModelAndView selectArtList(ModelAndView mv, @RequestParam(value="cPage", defaultValue="1") int currentPage, SearchArt searchArt) {
		PageInfo pi;
		
		pi = Pagination.getPageInfo(artService.selectArtListCount(searchArt), currentPage, 12, 10);
		mv.addObject("pi", pi)
		  .addObject("list", artService.selectArtList(pi, searchArt))
		  .addObject("searchArt", searchArt)
		  .setViewName("board/artBoard/artListView");
		
//		System.out.println("pi : " + pi);
//		System.out.println("list : " + artService.selectArtList(pi, searchArt));
		return mv;
	}
	
	@RequestMapping("enrollForm.at")
	public String toEnroll() {
		return "board/artBoard/artEnrollForm";
	}
	
	@RequestMapping(value="insertBoard.at")
	public String enrollArtBoard(Board board,
							   ArtBoard artBoard,
							   String[] options,
							   MultipartFile[] upFile,
							   HttpSession session,
							   HttpServletRequest request,
							   Model model) {
		
		// 로그인 나오면 지울 부
		Member loginUser = new Member();
		loginUser.setMemberNo(1);
		session.setAttribute("loginUser", loginUser);
		// 지울 부분 끝
		
		// 옵션 ArrayList에 담기
		ArrayList<Option> list = new ArrayList(); // VO들이 담긴 객체
		for(int i = 1; i <= options.length; i++) {
			Option option = new Option();
			ArrayList<DetailOption> detailList = new ArrayList();
			option.setMainOp(request.getParameter("option_" + i));
			for(int j = 0; j < request.getParameterValues("detailOp" + i).length; j++) {
				DetailOption detailOption = new DetailOption();
				detailOption.setDetail(request.getParameterValues("detailOp" + i)[j]);
				detailOption.setPrice(request.getParameterValues("opPrice" + i)[j]);
				detailList.add(detailOption);
			}
			option.setDetailOption(detailList);
			list.add(option);
		}
		
		// 파일 이름 바꾸기
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/artBoardFiles/");
		String folderPath = "resources/boardUpfiles/artBoardFiles/";
		ArrayList<BoardImage> files = new BoardController().saveFile(upFile, session, savePath, folderPath);
		
		// 상세설명 영역
		String boardContent = board.getBoardContent();
		JsonArray total  = new JsonParser().parse(boardContent).getAsJsonArray();
		for(int i = 0; i < total.size(); i++) {
			if("img".equals(total.get(i).getAsJsonObject().get("type").getAsString())) {
				JsonObject jobj = total.get(i).getAsJsonObject();
				jobj.keySet().remove("data");
				jobj.addProperty("data", files.get(files.size()-1).getModifyName());
				files.get(files.size()-1).setFileLevel(3);
			}
		}
		board.setBoardContent(total.toString());
		
		
		board.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = artService.insertArtBoard(board, artBoard, list, files);
		if(result > 0) {
			model.addAttribute("alertMsg", "업로드 성공");
		} else {
			model.addAttribute("alertMsg", "업로드 실패");
		}
		return "redirect:artList.bo?category=CI";
	}
	
	@RequestMapping(value="artDetail.bo")
	public ModelAndView artDetail(ModelAndView mv, int bno, HttpSession session) {
		
		System.out.println(bno);
		// 로그인 나오면 지울 부
		Member loginUser = new Member();
		loginUser.setMemberNo(1);
		session.setAttribute("loginUser", loginUser);
		// 지울 부분 끝
		
//		reply
//		re_reply
		
		// 로그인 번호 받고 selectArtBoard에 bno랑 mno를 int[]로 보내기
		
		
		int mno = ((Member)session.getAttribute("loginUser")).getMemberNo();
		HashMap maps = new HashMap();
		maps.put("mno", mno);
		maps.put("bno", bno);
		
		
		ArtBoard artBoard = artService.selectArtBoard(maps);
		ArrayList<Option> optionList = artService.selectOptionList(bno);
		ArrayList<BoardImage> boardImage = artService.selectBoardImage(bno);
		
//		ArrayList<Review> reviewList = reviewService.selectBoardReviewList(bno);
		
		
		
		// 이 부분 따로 빼는거 상의해야함
//		ArrayList<Reply1> replyList = replyService.selectReplyList(bno);
		
		mv.addObject("artBoard", artBoard)
		  .addObject("optionList", new Gson().toJson(optionList))
		  .addObject("boardImage", new Gson().toJson(boardImage))
//		  .addObject("reviewList", reviewList)
		  .addObject("bno",bno)
//		  .addObject("replyList", replyList)
		  .setViewName("board/artBoard/artDetailView");
		return mv;
	}
	
//	@RequestMapping("searchForm.at")
//	public ModelAndView searchForm(@RequestParam(value="cPage", defaultValue="1") int currentPage, ModelAndView mv, SearchArt searchArt){
//		System.out.println("search : " + searchArt.getSearch());
//		System.out.println("searchArt : " + searchArt.getKeyword());
//		System.out.println(artService.selectSearchListCount(searchArt));
//		PageInfo pi = Pagination.getPageInfo(artService.selectSearchListCount(searchArt), currentPage, 12, 10);
//		System.out.println(artService.selectSearchList(pi, searchArt).size());
//		mv.addObject("pi", pi).addObject("list", artService.selectSearchList(pi, searchArt)).setViewName("board/artBoard/artListView");
//		return mv;
//	}

	@RequestMapping("updateForm.at")
	public ModelAndView updateArtBoard(ModelAndView mv, int boardNo, HttpSession session){
		// 로그인 나오면 지울 부
		Member loginUser = new Member();
		loginUser.setMemberNo(1);
		session.setAttribute("loginUser", loginUser);
		// 지울 부분 끝
		
		
		
		int mno = ((Member)session.getAttribute("loginUser")).getMemberNo();
		
		HashMap maps = new HashMap();
		maps.put("mno", mno);
		maps.put("bno", boardNo);
		
		ArtBoard artBoard = artService.selectArtBoard(maps);
		artBoard.getBoard().setBoardNo(boardNo);
		ArrayList<Option> optionList = artService.selectOptionList(boardNo);
		ArrayList<BoardImage> boardImage = artService.selectBoardImage(boardNo);
		
		System.out.println(artBoard);
		System.out.println(optionList.toString());
		System.out.println(boardImage);
		
		mv.addObject("artBoard", artBoard)
		  .addObject("optionList", new Gson().toJson(optionList))
		  .addObject("boardImage", new Gson().toJson(boardImage))
		  .addObject("bno",boardNo)
		  .setViewName("board/artBoard/artUpdateView");
		return mv;
	}
	
	@RequestMapping("updateBoard.at")
	public String updateBoard(Board board,
						    ArtBoard artBoard,
						    String[] options,
						    MultipartFile[] upFile,
						    HttpSession session,
						    HttpServletRequest request,
						    Model model,
						    String imgs) {
		
		
		// 로그인 나오면 지울 부
		Member loginUser = new Member();
		loginUser.setMemberNo(1);
		session.setAttribute("loginUser", loginUser);
		// 지울 부분 끝
		
		ArrayList<Integer> optionNos = new ArrayList();
		for(int i = 0; i < artService.selectOptionList(board.getBoardNo()).size(); i++) {
			optionNos.add(artService.selectOptionList(board.getBoardNo()).get(i).getOptionNo());
		}
		
		
		
		// 옵션 ArrayList에 담기
		ArrayList<Option> list = new ArrayList(); // VO들이 담긴 객체
		for(int i = 1; i <= options.length; i++) {
			Option option = new Option();
			ArrayList<DetailOption> detailList = new ArrayList();
			option.setMainOp(request.getParameter("option_" + i));
			for(int j = 0; j < request.getParameterValues("detailOp" + i).length; j++) {
				DetailOption detailOption = new DetailOption();
				detailOption.setDetail(request.getParameterValues("detailOp" + i)[j]);
				detailOption.setPrice(request.getParameterValues("opPrice" + i)[j]);
				detailList.add(detailOption);
			}
			option.setDetailOption(detailList);
			option.setBoardNo(board.getBoardNo());
			list.add(option);
		}
		
		System.out.println(optionNos.toString());
		System.out.println(board);
		System.out.println(artBoard);
		System.out.println(list.toString());
		
		
		
		/*
			boardContent를 조회해와서 JsonArray를 toString 으로 문자열 비교를 해서
			같으면 : 상세설명 수정 안해도 됨
			다르면 : type별로 비교해서 다른 것만 바꿔주되,
				   img가 다른 것은....
			
		*/
		JsonArray imgsArray = new JsonParser().parse(imgs).getAsJsonArray();
		System.out.println(imgsArray.toString());
		System.out.println("aaa : " + imgsArray.get(0).getAsJsonObject().get("type").toString().equals("\"titleimg\""));
		System.out.println("ccc : " + imgsArray.get(0).getAsJsonObject().get("type").equals("\"titleimg\""));
		System.out.println("bbb : " + imgsArray.get(0).getAsJsonObject().get("type").toString());
		
		
		ArrayList<BoardImage> selectBoardImage = artService.selectBoardImage(board.getBoardNo()); // 해당 게시글에 있던 모든 BoardImage 리스트
		System.out.println(selectBoardImage.toString());
		ArrayList<Integer> deleteBoardImgNo = new ArrayList();
		for(int i = 0; i < imgsArray.size(); i++) {		// 전체 이미지 JsonArray에 담음 
			JsonObject img = imgsArray.get(i).getAsJsonObject();		// JsonArray 객체 하나씩 
			int imgFileLevel;
			if(img.get("type").toString().equals("\"titleimg\"")) {			// JsonArray type명에 따라서 imgFileLevel = 1 or 2
				imgFileLevel = 1;
			} else {
				imgFileLevel = 2;
			}
			for(int j = 0; j < selectBoardImage.size(); j++) {				// DB에 있던 ArrayList<BoardImage> 돌림
				if(selectBoardImage.get(j).getFileLevel() == imgFileLevel) {	// 각 BoardImage fileLevel이 JsonObject imgFilelevel이랑 같으면
					String src = img.get("src").toString();						// JsonObject src와 BoardImage src를 비교할 수 있게 JsonObject src 가공
					src.replaceAll("\"", "");
					System.out.println("src : " + src);
					if(!selectBoardImage.get(j).getModifyName().equals(src)) { 
						// src가 서로 같으면 update할 필요가 없음.
						// 그렇지만 src가 다른 경우 (기본값(이미지가 없을 때)은 imgsArray에 안담게 했 
						// DB에 있는 img를 삭제 후 file에서 데이터 받아서 가공 후 DB에 저장
						deleteBoardImgNo.add(selectBoardImage.get(j).getBoardImgNo());	// 나중에 deleteBoardImgNo리스트 들고 DB에서 삭제
						new File("/" + selectBoardImage.get(j).getModifyName()).delete();		// 해당 파일 resources 폴더에서 삭제
					}
				}
			}
		}
		// resources 파일 삭제
//		int totalFileSize = 0;
//		for(MultipartFile upfile : upFile) {
//			totalFileSize += upfile.getSize();
//		}
//		System.out.println("totalFileSize : " + totalFileSize);
//		
//		if(totalFileSize != 0) {
//			ArrayList<String> filePathList = new ArrayList();
//			for(int i = 0; i < artService.selectBoardImage(board.getBoardNo()).size(); i++) {
//				filePathList.add(artService.selectBoardImage(board.getBoardNo()).get(i).getFilePath());
//			}
//			for(int i = 0; i < filePathList.size(); i++) {
//				new File(filePathList.get(i)).delete();
//			}
//		}
		
		
		// 파일 이름 바꾸기
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/artBoardFiles/");
		String folderPath = "resources/boardUpfiles/artBoardFiles/";
		ArrayList<BoardImage> files = new BoardController().saveFile(upFile, session, savePath, folderPath);
//		System.out.println("upFile[0].getOriginalFilename() : " + upFile[0].getOriginalFilename());
//		System.out.println("upFile.getSize() : " + upFile[0].getSize());
//		System.out.println("upFile.length : " + upFile.length);
//		System.out.println("files : " + files);
		// 상세설명 영역
		JsonArray total  = new JsonParser().parse(board.getBoardContent()).getAsJsonArray();
		System.out.println("total.toString() : " + total.toString());
		for(int i = 0; i < total.size(); i++) {
			if("img".equals(total.get(i).getAsJsonObject().get("type").getAsString())) {
				JsonObject jobj = total.get(i).getAsJsonObject();
				
				System.out.println("jobj : " + jobj);
				System.out.println("files.get(files.size()-1).getModifyName() : " + files.get(files.size()-1).getModifyName());
				
				jobj.keySet().remove("data");
				jobj.addProperty("data", files.get(files.size()-1).getModifyName());
				files.get(files.size()-1).setFileLevel(3);
			}
		}
		board.setBoardContent(total.toString());
		
		
		board.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = artService.updateArtBoard(board, artBoard, list, files, optionNos);
		if(result > 0) {
			model.addAttribute("alertMsg", "업로드 성공");
		} else {
			model.addAttribute("alertMsg", "업로드 실패");
		}
		return "redirect:artList.bo?category=CI";
	}
	
	@RequestMapping("deleteBoard.at")
	public String deleteBoard(int boardNo) {
		return "redirect:artList.bo";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
