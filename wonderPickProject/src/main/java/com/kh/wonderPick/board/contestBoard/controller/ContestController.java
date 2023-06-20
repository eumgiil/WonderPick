package com.kh.wonderPick.board.contestBoard.controller;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.boardCommon.model.vo.Heart;
import com.kh.wonderPick.board.contestBoard.model.service.ContestService;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;
import com.kh.wonderPick.board.contestBoard.model.vo.Search;

@Controller
public class ContestController {
	
	@Autowired
	private ContestService contestService;
	
	@RequestMapping("selectTop10.ct")
	public String selectTop10(Model model) {
		
		
		
		
		model.addAttribute("list",contestService.selectTop10());
		
		return "board/contestBoard/contestMain";
		
	}
	
	@RequestMapping("enrollForm.ct")
	public String contestEnrollForm() {
		return "board/contestBoard/contestEnrollForm";
	}
	
	@RequestMapping("insertContest.ct")
	public String insertContest(Board board,
//								BoardImage boardImage,
//								Contest contest,
								int price,
								MultipartFile thumbnailUpFile,
								MultipartFile[] upFile,
								Model model,
								HttpSession session) {
		
		
		
		//System.out.println(board);
		//System.out.println(upFile[0]);
		//System.out.println(c);

		ArrayList<BoardImage> list = new ArrayList();
		
		String originName = thumbnailUpFile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		int randomNumber = (int)(Math.random() * 9000 + 1000);
		
		String changeName = currentTime + randomNumber + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
		
		try {
			thumbnailUpFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		BoardImage boardImage =  new BoardImage();
		boardImage.setOriginName(originName);
		boardImage.setModifyName(board.getBoardTitle());
		boardImage.setFileLevel(1);
		boardImage.setFilePath("resources/boardUpfiles/emoticonFiles/" + changeName);
		
		list.add(boardImage);
		
		
		
		
		for(MultipartFile multipartFile : upFile) {
			
			if(multipartFile.getSize() != 0) {
				
				
				
				String originName2 = multipartFile.getOriginalFilename();
				
				String currentTime2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
				
				String ext2 = originName2.substring(originName2.lastIndexOf("."));
				
				int randomNumber2 = (int)(Math.random() * 9000 + 1000);
				
				String changeName2 = currentTime2 + randomNumber2 + ext2;
				
				String savePath2 = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
				
				try {
					multipartFile.transferTo(new File(savePath2 + changeName2));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				boardImage =  new BoardImage();
				boardImage.setOriginName(originName2);
				boardImage.setModifyName(board.getBoardTitle());
				boardImage.setFileLevel(2);
				boardImage.setFilePath("resources/boardUpfiles/emoticonFiles/" + changeName2);
				
				list.add(boardImage);
			}
			
		}
		
		int result = contestService.insertContest(board, list, price);
		
		if(result > 0) {
			
			model.addAttribute("result", result);
			session.setAttribute("alertMsg", "공모전 등록 성공!!" );
			return "board/contestBoard/contestMain";
			
		}else {
			model.addAttribute("errorMsg", "게시글 작성에 실패하였습니다.");
			return "board/contestBoard/contestMain";
		}
		

	}
	// 투표하기 페이지 최신순 list select
	@RequestMapping("selectVotePage.ct")
	public String selectVotePage(Model model) {
		
		model.addAttribute("list", contestService.selectVotePage());
		
		
		return "board/contestBoard/contestVote";
	}
	
	// 투표 페이징 처리(플러스 버튼)
	@ResponseBody
	@RequestMapping(value="moreList.ct", produces="application/json; charset=UTF-8")
	public String selectMoreList(int checkNumber, Contest contest) {
		
		int endNumber = checkNumber + 12;
		
		contest.setStartNumber(checkNumber);
		contest.setEndNumber(endNumber);
		
		return new Gson().toJson(contestService.selectMoreList(contest));
		
	}
	
	// 게시판 DetailView
	@RequestMapping("contestDetail.ct")
	public ModelAndView selectContestDetail(int boardNo, ModelAndView modelAndView) {
		
		//System.out.println("hihhihihi");
		//System.out.println(boardNo);
		
		if(contestService.increaseCount(boardNo) > 0 ) {
			modelAndView.addObject("b",contestService.selectContestDetail(boardNo)).setViewName("board/contestBoard/contestDetailView");
		}else {
			modelAndView.addObject("errorMsg", "상세조회 실패ㅠ").setViewName("errorPage");
		}
		
		contestService.selectContestDetail(boardNo);
		
		
		return modelAndView;
	}
	
	@RequestMapping("contestWinnerList.ct")
	public String selectWinnerList(Model model) {
		
		model.addAttribute("list",contestService.selectWinnerList());
		
		return "board/contestBoard/contestWinnerList";
	}
	
	@ResponseBody
	@RequestMapping(value="selectVoteLike.ct", produces="application/json; charset=UTF-8")
	public String selectVoteLike(int boardNo) {
		
		System.out.println("hihi55 :" +  boardNo);
		
		return new Gson().toJson(contestService.selectVoteLike(boardNo));
	}
	
	@ResponseBody
	@RequestMapping(value="insertVoteHeart.ct", produces="application/json; charset=UTF-8")
	public String updateVoteLike(int boardNo, int memberNo, Heart heart) {
			heart.setBoardNo(boardNo);
			heart.setMemberNo(memberNo);
		return new Gson().toJson(contestService.insertVoteHeart(heart));
	}
	@ResponseBody
	@RequestMapping(value="deleteVoteHeart.ct", produces="application/json; charset=UTF-8")
	public String deleteVoteHeart(int boardNo, int memberNo, Heart heart) {
		
		System.out.println(boardNo);
		
		heart.setBoardNo(boardNo);
		heart.setMemberNo(memberNo);
		return new Gson().toJson(contestService.deleteVoteHeart(heart));
	}
	
	
}




