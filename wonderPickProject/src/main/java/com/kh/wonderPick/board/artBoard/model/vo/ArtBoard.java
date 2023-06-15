package com.kh.wonderPick.board.artBoard.model.vo;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.member.model.vo.Member;
import com.kh.wonderPick.member.model.vo.MemberImage;

import lombok.Data;

@Data
public class ArtBoard{
	
	private int boardNo; // BOARD_NO	NUMBER
	private String fileType; // FILE_TYPE	VARCHAR2(5 BYTE)
	private String dpi; // DPI	VARCHAR2(20 BYTE)
	private String defaultSize; // DEFAULT_SIZE	VARCHAR2(50 BYTE)
	private String modifyCount; // MODIFY_COUNT	NUMBER
	private String workday; // WORKDAY	VARCHAR2(100 BYTE)
	private String category; // CATEGORY	VARCHAR2(2 BYTE)
	private String price; // PRICE	NUMBER
	
	private Member member;
	private MemberImage memberImage;
	private Board board;
	
}
