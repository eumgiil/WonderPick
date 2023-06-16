package com.kh.wonderPick.board.goods.model.vo;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;

import lombok.Data;

@Data
public class Goods extends Board{
	
	private int board_no;
	private int price; //PRICE	NUMBER
	private int draft; //DRAFT	NUMBER
	private int modifyCount; //MODIFY_COUNT	NUMBER
	private String workday;//WORKDAY	VARCHAR2(100 BYTE)
	private int addDraft; //ADD_DRAFT	NUMBER
	private int addModify;//ADD_MODIFY	NUMBER
	private int amount;//AMOUNT	NUMBER
	private String goodsCategory; //GOODS_CATEGORY	VARCHAR2(15 BYTE)
	private String addInfo; //ADD_INFO	VARCHAR2(1000 BYTE)
	private String nickName;
	private String originName;
	private String modifyName;
	private int goodsNo;
	private int fileLevel;
	private String filePath;
	
	
	
	
	
	
}


