package com.kh.wonderPick.board.reply.model.vo;

import lombok.Data;

@Data
public class Re_Reply1 {
	
	private int reReplyNo; //RE_REPLY_NO	NUMBER
	private int replyNo; //REPLY_NO	NUMBER
	private int member_no; //MEMBER_NO	NUMBER
	private String content; //CONTENT	VARCHAR2(1000 BYTE)
	private String createDate; //CREATE_DATE	DATE
	private String nickname;
	
	private String memberModifyName;
}
