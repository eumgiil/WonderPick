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
//								BoardImage boardImage,
								MultipartFile thumbnailUpFile,
								MultipartFile[] upFile,
								Contest contest,
								Model model,
								HttpSession session) {
		
		//System.out.println(b);
		//System.out.println(upFile[0]);
		//System.out.println(c);
		System.out.println("썸네일" + thumbnailUpFile);

		ArrayList list = new ArrayList();
		
		String originName = thumbnailUpFile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		
		String ext = originName.substring(originName.lastIndexOf("."));
		
		int randomNumber = (int)(Math.random() * 9000 + 1000);
		
		String changeName = currentTime + randomNumber + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
		
		//multipartFile.transferTo(new File(savePath + changeName));
		
		BoardImage boardImage =  new BoardImage();
		boardImage.setOriginName(originName);
		boardImage.setModifyName(board.getBoardTitle());
		boardImage.setFileLevel(1);
		boardImage.setFilePath("/resources/boardUpfiles/emoticonFiles/" + changeName);
		
		list.add(boardImage);
		
		
		
		
		
		for(MultipartFile multipartFile : upFile) {
			
			if(multipartFile.getSize() != 0) {
				
				
				
				String originName2 = multipartFile.getOriginalFilename();
				
				System.out.println("나머지들 :" + originName2);
				
				String currentTime2 = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
				
				String ext2 = originName2.substring(originName2.lastIndexOf("."));
				
				int randomNumber2 = (int)(Math.random() * 9000 + 1000);
				
				String changeName2 = currentTime2 + randomNumber2 + ext2;
				
				String savePath2 = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
				
				try {
					multipartFile.transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				boardImage =  new BoardImage();
				boardImage.setOriginName(originName2);
				boardImage.setModifyName(board.getBoardTitle());
				boardImage.setFileLevel(2);
				boardImage.setFilePath("/resources/boardUpfiles/emoticonFiles/" + changeName2);
				
				list.add(boardImage);
			}
			
		}
		
		//System.out.println(list);
		
		
//		for(int i = 0; i < list.size(); i++) {
//			
//			String originName = list.get(i)
//			
//			String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
//			System.out.println("1");
//			
//			String ext = originName.substring(originName.lastIndexOf("."));
//			
//			System.out.println("2");
//			
//			int randomNumber = (int)(Math.random() * 90000 + 10000);
//			
//			String changeName = currentTime + randomNumber + ext;
//			System.out.println("3");
//			
//			String savePath = session.getServletContext().getRealPath("/resources/boardUpfiles/emoticonFiles/");
//			
//			
//				//multipartFile.transferTo(new File(savePath + changeName));
//				
//			
//			
//			boardImage.setOriginName(originName);
//			boardImage.setModifyName(board.getBoardTitle());
//			boardImage.setFilePath("/resources/boardUpfiles/emoticonFiles/" + changeName);
//			
//			if(i == 0) {
//				boardImage.setFileLevel(1);
//			}else {
//				boardImage.setFileLevel(2);
//			}
//			
//			
////			list.add(boardImage);
//		
//		}
		
		
		

	
		//System.out.println("number 1 :" +  b);
		//System.out.println("22222 : " + bi);
		//System.out.println("33 :" + c);
		
		
		if(contestService.insertContest(board, list, contest) > 0) {
			session.setAttribute("alertMsg", "공모전 등록 성공!!" );
			return "board/contestBoard/contestMain";
			
		}else {
			model.addAttribute("errorMsg", "게시글 작성에 실패하였습니다.");
			return "board/contestBoard/contestMain";
		}
		
		

		
		

	}


}
