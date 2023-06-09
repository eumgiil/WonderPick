package com.kh.wonderPick.board.artBoard.model.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ArtBoardDTO {

	private int boardNo;
	private String boardTitle;
	private String nickname;
	private int price;
	private int star;
	private String modifyName;
	private String memberModifyName;
	private String category;
	private int heart;
	
	private Date createDate;
}
