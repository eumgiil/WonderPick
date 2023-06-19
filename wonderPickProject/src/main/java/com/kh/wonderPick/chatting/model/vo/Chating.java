package com.kh.wonderPick.chatting.model.vo;

import lombok.Data;

@Data
public class Chating {
	private String roomName;
	private int memberNo;
	private int artistNo;
	private String artistNickName;//ARTIST_NO NUMBER NOT NULL,
	private String membertNickName;//MEMBER_NO NUMBER NOT NULL,
}
