package com.kh.wonderPick.board.boardCommon.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Board {

	private int boardNo; // BOARD_NO	NUMBER
	private int memberNo; // MEMBER_NO	NUMBER
	private String boardTitle; // BOARD_TITLE	VARCHAR2(100 BYTE)
	private String boardContent; //BOARD_CONTENT	VARCHAR2(3000 BYTE)
	private String createDate; // CREATE_DATE	DATE
	private String status; // STATUS	VARCHAR2(1 BYTE)
	private int boardCount; //  BOARD_COUNT	NUMBER
	private String boardType; // BOARD_TYPE	VARCHAR2(2 BYTE) 
	
}
