package com.kh.wonderPick.board.contestBoard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
	public String insertContest(Board b,
								BoardImage bi,
								Contest c,
								MultipartFile[] upFile,
								Model model,
								HttpSession session) {
		
		System.out.println(b);
		System.out.println(upFile.length);
		
	
		
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
			
			bi.setOriginName(multipartFile.getOriginalFilename());
			bi.setModifyName("/resources/boardUpfiles/emoticonFiles/");
			
		
	}
		
		if(contestService.insertContest(b, bi, c) > 0) {
			session.setAttribute("alertMsg", "공모전 등록 성공!!" );
			return "board/contestBoard/contestMain";
			
			
		}else {
			model.addAttribute("errorMsg", "게시글 작성에 실패하였습니다.");
			return "board/contestBoard/contestMain";
		}
		
		

		
		

	}

}
