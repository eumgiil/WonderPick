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
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.kh.wonderPick.board.boardCommon.model.vo.Reply;
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
		
//		// 로그인 나오면 지울 부
//		Member loginUser = new Member();
//		loginUser.setMemberNo(1);
//		session.setAttribute("loginUser", loginUser);
//		// 지울 부분 끝
		
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
		
		
		
		
		return "redirect:artList.bo";
	}
	
	@RequestMapping(value="artDetail.bo")
	public ModelAndView artDetail(ModelAndView mv, int bno, HttpSession session) {
		
		
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
		mv.addObject("artBoard", artBoard)
		  .addObject("optionList", new Gson().toJson(optionList))
		  .addObject("boardImage", new Gson().toJson(boardImage))
		  .addObject("bno",bno)
		  .setViewName("board/artBoard/artDetailView");
		return mv;
	}
	

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
						    MultipartFile contentFile,
						    MultipartFile[] upFile,
						    HttpSession session,
						    HttpServletRequest request,
						    Model model,
						    String deleteImgs,
						    String updateImgs,
						    String insertImgs) {
		
		
//		// 로그인 나오면 지울 부
//		Member loginUser = new Member();
//		loginUser.setMemberNo(1);
//		session.setAttribute("loginUser", loginUser);
//		// 지울 부분 끝
		
		// 삭제할 옵션 no
		ArrayList<Integer> deleteOptionNos = new ArrayList();
		for(int i = 0; i < artService.selectOptionList(board.getBoardNo()).size(); i++) {
			deleteOptionNos.add(artService.selectOptionList(board.getBoardNo()).get(i).getOptionNo());
		}
		// 옵션 ArrayList에 담기
		ArrayList<Option> optionList = new ArrayList(); // VO들이 담긴 객체
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
			optionList.add(option);
		}
		
		
		
		/*
		 *	imgs에는 두 가지 유형의 파일이 들어있다.
		 *	두 가지의 전제 조건은 "파일을 업로드하지 않았다" 이다
		 *	
		 *	1. 기존 이미지를 그대로 사용 할 경우 -> src = 1이다.
		 *	2. 올렸던 이미지를 삭제 할 경우 
		 */
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/artBoardFiles/");
		String folderPath = "resources/boardUpfiles/artBoardFiles/";
		
		
		JsonArray deleteImgsArray = new JsonParser().parse(deleteImgs).getAsJsonArray(); // 이미지 삭제
		JsonArray updateImgsArray = new JsonParser().parse(updateImgs).getAsJsonArray(); // 이미지 수정 
		JsonArray insertImgsArray = new JsonParser().parse(insertImgs).getAsJsonArray(); // 이미지 수정 
		
		ArrayList<Integer> deleteBoardImgNo = new ArrayList();
		ArrayList<BoardImage> updateBoardImages = new ArrayList();
		ArrayList<BoardImage> insertBoardImages = new ArrayList();
		
		BoardImage boardImage = new BoardImage();
		// 삭제할 boardImgNo가 들어있는 Array  => update로 바꿔야함
		for(int i = 0; i < deleteImgsArray.size(); i++) {
			// resources 폴더에서 삭제
			if(null != deleteImgsArray.get(i).getAsJsonObject().get("src").getAsString()) {
				String src = deleteImgsArray.get(i).getAsJsonObject().get("src").getAsString();
				String modifyName = artService.deleteImgPath(artService.selectBoardImgNo(src)).getModifyName();
				new File(session.getServletContext().getRealPath(modifyName)).delete();
			}
			// DB에서 삭제하기 위해 array에 담기
			deleteBoardImgNo.add(deleteImgsArray.get(i).getAsJsonObject().get("boardImgNo").getAsInt());
		}
		
		// boardImage 이름 변경 및 resources 폴더에 파일 업로드 / arrayList에 업데이트 할 파일 담기
		for(int i = 0; i < updateImgsArray.size(); i++) {
			int Filei = updateImgsArray.get(i).getAsJsonObject().get("upFile[i]").getAsInt();
			boardImage = new BoardController().saveUpdate(upFile[Filei], session, savePath, folderPath);
			boardImage.setBoardImgNo(updateImgsArray.get(i).getAsJsonObject().get("boardImgNo").getAsInt());
			updateBoardImages.add(boardImage);
		}
		
		// insert boardImages
		for(int i = 0; i < insertImgsArray.size(); i++) {
			int insertInt = insertImgsArray.get(i).getAsJsonObject().get("insertUpFile[i]").getAsInt();
			boardImage = new BoardController().saveUpdate(upFile[insertInt], session, savePath, folderPath);
			boardImage.setBoardNo(board.getBoardNo());
			if(insertInt == 0) {
				boardImage.setFileLevel(1);
			} else {
				boardImage.setFileLevel(2);
			}
			insertBoardImages.add(boardImage);
		}
		System.out.println("insertBoardImages.toString() : " + insertBoardImages.toString());
		
		
		// 상세설명 영역
		// boardContent 불러오고 내용 싹 삭제 한 뒤 내용 그대로 다시 추가하면 됨
		int mno = ((Member)session.getAttribute("loginUser")).getMemberNo();
		HashMap maps = new HashMap();
		maps.put("mno", mno);
		maps.put("bno", board.getBoardNo());
		ArtBoard beforeArtBoard = artService.selectArtBoard(maps); 
		// 기존 artBoard의 Content에 접근해서 img가 있는지 판단 후 resources폴더에서 삭제, DB에서 이미지 삭제하는 메소드의 매개변수 배열에 추가
		JsonArray total  = new JsonParser().parse(beforeArtBoard.getBoard().getBoardContent()).getAsJsonArray();
		for(int i = 0; i < total.size(); i++) {
			if("img".equals(total.get(i).getAsJsonObject().get("type").getAsString())) {
				String src = total.get(i).getAsJsonObject().get("data").getAsString();
				new File("/" + src).delete(); // resources 폴더에서 삭제
				int imgNo = artService.selectBoardImgNo(src);
				if(imgNo != 0) {
					deleteBoardImgNo.add(imgNo);	// 기존 이미지 삭제 메소드 매개변수에 추가
				}
				
			}
		}
		
		// 새로 입력된 boardContent 1. resources 폴더에서 저장 2. DB에 저장
		String afterContent = board.getBoardContent();
		JsonArray aftertotal  = new JsonParser().parse(afterContent).getAsJsonArray();
		for(int i = 0; i < aftertotal.size(); i++) {
			if("img".equals(aftertotal.get(i).getAsJsonObject().get("type").getAsString())) {
				// resources폴더에 저장, modifyName 추가
				
				// img가 있어도 실제로 파일을 올리지 않았을 수 있음
				if(contentFile.getSize() != 0) {
					boardImage = new BoardController().saveUpdate(contentFile, session, savePath, folderPath);
					boardImage.setFileLevel(3);
					
					JsonObject jobj = aftertotal.get(i).getAsJsonObject();
					jobj.keySet().remove("data");
					jobj.addProperty("data", boardImage.getModifyName());
				}
			}
		}
		board.setBoardContent(aftertotal.toString());
		
//		board.setMemberNo(((Member)session.getAttribute("loginUser")).getMemberNo());
		int result = artService.updateArtBoard(board, artBoard, deleteOptionNos, optionList, deleteBoardImgNo, updateBoardImages, insertBoardImages);
		if(result > 0) {
			model.addAttribute("alertMsg", "업로드 성공");
		} else {
			model.addAttribute("alertMsg", "업로드 실패");
		}
		return "redirect:artList.bo";
	}
	
	@RequestMapping("deleteBoard.at")
	public String deleteBoard(Model model, int boardNo) {
		if(artService.deleteBoard(boardNo) <= 0) {
			model.addAttribute("alertMsg", "삭제 실패");
		}
		return "redirect:artList.bo";
	}
	
	
	
	
	
	
	
	
										/* 문의 댓글 관련  */
	// 문의 댓글 목록 조회
	@ResponseBody
	@RequestMapping(value="rlist.at", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int boardNo, ModelAndView mv, HttpSession session) {
		ArrayList<Reply> replyList = new ArrayList<Reply>();
		Reply reply = new Reply();
		replyList.add(reply);
		return new Gson().toJson(artService.selectReplyList(boardNo));
	}
	// 문의 댓글 쓰기
	@ResponseBody
	@RequestMapping("rinsert.at")
	public String ajaxInsertReply(Reply r, HttpSession session) {
		return artService.insertReply(r) > 0 ? "success" : "fail";
	}
	// 댓글 삭제
	@RequestMapping("deleteReply.at")
	public String deleteReply(int replyNo, int bno, HttpSession session) {
		if(artService.deleteReply(replyNo) > 0) {
			session.setAttribute("alertMsg", "댓글 삭제 완료");
			return "redirect:artDetail.bo?bno=" + bno;
		}else {
			session.setAttribute("errorMsg", "댓글 삭제 실패");
			return "redirect:artDetail.bo?bno=" + bno;
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
