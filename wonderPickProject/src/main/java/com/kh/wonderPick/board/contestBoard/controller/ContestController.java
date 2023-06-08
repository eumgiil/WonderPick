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
import org.springframework.web.multipart.MultipartFile;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.contestBoard.model.service.ContestService;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;

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
								BoardImage boardImage,
								Contest contest,
								MultipartFile thumbnailUpFile,
								MultipartFile[] upFile,
								Model model,
								HttpSession session) {
		
		//System.out.println(b);
		//System.out.println(upFile.length);
		
		
		ArrayList list = new ArrayList();
		
		String originName2 = thumbnailUpFile.getOriginalFilename();
		
		String currentTime2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		
		int randomNumber2 = (int)(Math.random() * 90000 + 10000);
		
		String ext2 = originName2.substring(originName2.lastIndexOf("."));
		
		String changeName2 = currentTime2 + randomNumber2 + ext2;
		
		
		String savePath2 = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
		
		try {
			thumbnailUpFile.transferTo(new File(savePath2 + changeName2));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		boardImage.setOriginName(thumbnailUpFile.getOriginalFilename());
		boardImage.setModifyName("/resources/boardUpfiles/emoticonFiles/");
		
		list.add(boardImage);
		
		
		
	
		
		for(MultipartFile multipartFile : upFile) {
			
			String originName = multipartFile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
			
			int randomNumber = (int)(Math.random() * 90000 + 10000);
			
			String ext = originName.substring(originName.lastIndexOf("."));
			
			String changeName = currentTime + randomNumber + ext;
			
			
			String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
			
			try {
				multipartFile.transferTo(new File(savePath + changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			boardImage.setOriginName(multipartFile.getOriginalFilename());
			boardImage.setModifyName("/resources/boardUpfiles/emoticonFiles/");
			
			list.add(boardImage);
			
		
	}
		
		
		
		
		if(contestService.insertContest(board, list, contest) > 0) {
			session.setAttribute("alertMsg", "공모전 등록 성공!!" );
			return "board/contestBoard/contestMain";
			
			
		}else {
			model.addAttribute("errorMsg", "게시글 작성에 실패하였습니다.");
			return "board/contestBoard/contestMain";
		}
		
		

		
		

	}

}
