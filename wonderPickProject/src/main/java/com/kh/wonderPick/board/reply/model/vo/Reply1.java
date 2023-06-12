package com.kh.wonderPick.board.reply.model.vo;

import lombok.Data;

@Data
public class Reply1 {
	
	private int replyNo; //REPLY_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int memberNo; //MEMBER_NO	NUMBER
	private String content; //CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private String nickname;
//	private String secret;
	
	private String memberModifyName;
	
	private Re_Reply1 reReply;
}
