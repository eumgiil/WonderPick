package com.kh.wonderPick.board.contestBoard.model.vo;

import java.sql.Date;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;

import lombok.Data;

@Data
public class Contest extends Board{
	
	private int emoticonNo; 	// EMOTICON_NO	NUMBER
	//private int boardNo; 		// BOARD_NO	NUMBER
	private int imgNo; 		// IMG_NO	NUMBER
	private int price; 			// PRICE	NUMBER
	private int priceStatus; 	// PRICE_STATUS	NUMBER
	
	
	// 멤버추가
	private String nickName;
	private String memberModifyName;
	private String modifyName;
	private Date uploadDate;
	
	
	//투표 추가 
	private int voteStatus;
	private int voteCount;
	
	private String filePath;
	
	
	// 더보기 페이징 처리 
	private int startNumber;
	private int endNumber;
	
	private int winner;
	
	
	
	
	
	
	
	
	
	
	
	
	

}