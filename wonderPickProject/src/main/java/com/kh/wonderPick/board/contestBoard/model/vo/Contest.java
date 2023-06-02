package com.kh.wonderPick.board.contestBoard.model.vo;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;

import lombok.Data;

@Data
public class Contest extends Board{
	
	private int emoticonNo; 	// EMOTICON_NO	NUMBER
	private int boardNo; 		// BOARD_NO	NUMBER
	private int img_no; 		// IMG_NO	NUMBER
	private int price; 			// PRICE	NUMBER
	private int priceStatus; 	// PRICE_STATUS	NUMBER
	
	//투표 추가 
	private int voteStatus;
	private int voteCount;
	

}