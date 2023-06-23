package com.kh.wonderPick.member.model.vo;

import lombok.Data;

@Data
public class MemberImage {

	private int memberImgNo; // IMG_NO	NUMBER
	private int memberNo; // MEMBER_NO	NUMBER
	private String memberOriginName; // ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String memberModifyName; // MEMBER_MODIFY_NAME	VARCHAR2(1000 BYTE)
	private String memberUploadDate; // UPLOAD_DATE	DATE
	private String memberFilePath; // sFILE_LEVEL	NUMBER
}
