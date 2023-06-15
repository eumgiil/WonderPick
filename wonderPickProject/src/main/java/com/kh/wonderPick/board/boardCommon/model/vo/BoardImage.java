package com.kh.wonderPick.board.boardCommon.model.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data

public class BoardImage {
	
	private int boardImgNo; //BOARD_IMG_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private String originName; //ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String modifyName; //MODIFY_NAME	VARCHAR2(1000 BYTE)
	private String uploadDate; //UPLOAD_DATE	DATE
	private int fileLevel; //FILE_LEVEL	NUMBER 1-썸네일 2-그 외 3-상세설명
	
	private String filePath;


}
