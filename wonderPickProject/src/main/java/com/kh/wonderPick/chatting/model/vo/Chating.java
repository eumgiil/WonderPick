package com.kh.wonderPick.chatting.model.vo;

import lombok.Data;

@Data
public class Chating {
	private String roomName;
	private String chatingFile;//CHATING_FILE VARCHAR2(300) PRIMARY KEY,
	private String artistNickName;//ARTIST_NO NUMBER NOT NULL,
	private String membertNickName;//MEMBER_NO NUMBER NOT NULL,
}
