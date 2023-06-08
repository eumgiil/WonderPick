package com.kh.wonderPick.chatting.model.vo;

import java.util.Date;

import lombok.Data;

@Data
public class BeforeReadChatings {
	private String roomName;
	private String fromMember;
	private String toMember;
	private String content;
	private String enrollDate;
	private int ReadCheck;
}
