package com.kh.wonderPick.board.artBoard.model.vo;

import java.util.ArrayList;

import lombok.Data;

@Data
public class Option {
	
	private int optionNo; // OP_DETAIL_NO	NUMBER
	private int boardNo;
	private String mainOp;
	
	private ArrayList<DetailOption> detailOption;
	
		
}
