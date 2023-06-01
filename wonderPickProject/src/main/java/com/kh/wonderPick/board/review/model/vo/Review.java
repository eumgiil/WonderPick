package com.kh.wonderPick.board.review.model.vo;

import lombok.Data;

@Data
public class Review {
	
	private int reviewNo; //REVIEW_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int memberNo; //MEMBER_NO	NUMBER
	private int star; //STAR	NUMBER
	private String originName; //ORIGIN_NAME	VARCHAR2(1000 BYTE)
	private String modifyName; //MODIFY_NAME	VARCHAR2(1000 BYTE)

}
