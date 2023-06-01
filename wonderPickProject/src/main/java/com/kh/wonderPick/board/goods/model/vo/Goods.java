package com.kh.wonderPick.board.goods.model.vo;

import lombok.Data;

@Data
public class Goods {
	
	private int boardNo; //BOARD_NO	NUMBER
	private int price; //PRICE	NUMBER
	private int draft; //DRAFT	NUMBER
	private int modifyCount; //MODIFY_COUNT	NUMBER
	private String workDay;//WORKDAY	VARCHAR2(100 BYTE)
	private int addDraft; //ADD_DRAFT	NUMBER
	private int addModify;//ADD_MODIFY	NUMBER
	private int amount;//AMOUNT	NUMBER
	private String goodsCategory; //GOODS_CATEGORY	VARCHAR2(15 BYTE)
	private String addInfo; //ADD_INFO	VARCHAR2(1000 BYTE)

}
