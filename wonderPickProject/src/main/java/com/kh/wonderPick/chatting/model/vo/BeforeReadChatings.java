package com.kh.wonderPick.chatting.model.vo;


import lombok.Data;

@Data
public class BeforeReadChatings {
	private String roomName;
	private int boardNo;
	private String fromMember;
	private String toMember;
	private String content;
	private String enrollDate;
	private String readCheck;
}
