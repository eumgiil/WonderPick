package com.kh.wonderPick.board.artBoard.model.vo;

import com.kh.wonderPick.board.model.vo.Board;

import lombok.Data;

@Data
public class ArtBoard extends Board{

	private String fileType; // FILE_TYPE	VARCHAR2(5 BYTE)
	private String dpi; // DPI	VARCHAR2(20 BYTE)
	private String defaultSize; // DEFAULT_SIZE	VARCHAR2(50 BYTE)
	private int modifyCount; // MODIFY_COUNT	NUMBER
	private String workday; // WORKDAY	VARCHAR2(100 BYTE)
	private String category; // CATEGORY	VARCHAR2(2 BYTE)
	
}