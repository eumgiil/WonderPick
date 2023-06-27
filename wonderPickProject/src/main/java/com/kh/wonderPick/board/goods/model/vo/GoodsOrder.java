package com.kh.wonderPick.board.goods.model.vo;

import lombok.Data;

@Data
public class GoodsOrder {
	
	private int orderNo; //ORDER_NO	NUMBER
	private int boardNo; //BOARD_NO	NUMBER
	private int memberNo; //MEMBER_NO	NUMBER
	private String orderTitle; //ORDER_TITLE	VARCHAR2(100 BYTE)
	private int price; //PRICE	NUMBER
	private int amount; //AMOUNT	NUMBER
	private String orderStatus; //ORDER_STATUS	VARCHAR2(30 BYTE)
	private String orderDate; //ORDER_DATE	DATE
	private int addDraft; //ADD_DRAFT	NUMBER
	private int addModify ; //ADD_MODIFY	NUMBER

}
