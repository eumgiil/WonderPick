package com.kh.wonderPick.board.boardCommon.model.vo;

import lombok.Data;

@Data
public class Reply {
	
	private int replyNo; //REPLY_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int memberNo; //MEMBER_NO	NUMBER
	private String content; //CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private String nickname;
	private int fileLevel;
	private String filePath;
}
