package com.kh.wonderPick.member.model.vo;

import lombok.Data;

@Data
public class MemberImage {

	private int imgNo; // IMG_NO	NUMBER
	private int memberNo; // MEMBER_NO	NUMBER
	private String originName; // ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String memberModifyName; // MEMBER_MODIFY_NAME	VARCHAR2(1000 BYTE)
	private String uploadDate; // UPLOAD_DATE	DATE
	private int fileLevel; // sFILE_LEVEL	NUMBER
	
}
