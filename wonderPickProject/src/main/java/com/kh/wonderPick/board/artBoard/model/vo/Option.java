package com.kh.wonderPick.board.artBoard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Option {
	
	private int optionNo; // OP_DETAIL_NO	NUMBER
	private int board_no;
	private String mainOp;
	private String detail;
	private String price;
	private ArrayList opPr;
		
}
