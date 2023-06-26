package com.kh.wonderPick.board.boardCommon.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;

public class BoardController {

	public ArrayList<BoardImage> saveFile(MultipartFile[] upFile, HttpSession session, String savePath, String folderPath) {
		
		ArrayList<BoardImage> list = new ArrayList();
		for(int i = 0; i < upFile.length; i ++) {
			if(upFile[i].getSize() != 0) {

				String originName = upFile[i].getOriginalFilename();
				String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
				String ext = originName.substring(originName.lastIndexOf("."));
				int randomNumber = (int)(Math.random() * 9000 + 1000);
				String changeName = currentTime + randomNumber + ext;
				
				try {
					upFile[i].transferTo(new File(savePath + changeName));
				} catch (IllegalStateException | IOException e) {
					e.printStackTrace();
				}
				
				BoardImage boardImage =  new BoardImage();
				boardImage.setOriginName(originName);
				boardImage.setModifyName(folderPath + changeName);
				if(i == 0) {
					boardImage.setFileLevel(1);
				} else {
					boardImage.setFileLevel(2);
				}
				boardImage.setFilePath(folderPath + changeName);
				
				list.add(boardImage);
			}
		}
		return list;
	}
	
	public BoardImage saveUpdate(MultipartFile upFile, HttpSession session, String savePath, String folderPath) {
		
		String originName = upFile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmm").format(new Date());
		String ext = originName.substring(originName.lastIndexOf("."));
		int randomNumber = (int)(Math.random() * 9000 + 1000);
		String changeName = currentTime + randomNumber + ext;
		
		try {
			upFile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		BoardImage boardImage =  new BoardImage();
		boardImage.setOriginName(originName);
		boardImage.setModifyName(folderPath + changeName);
//		boardImage.setFileLevel();	 return 받은 영역에서 set 할 것
		boardImage.setFilePath(folderPath + changeName);
		
		return boardImage;
	}
	
	
	
	
	
	
	
	
	
	
}
