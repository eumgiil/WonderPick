package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;

public interface ArtBoardService {

	ArrayList<ArtBoard> selectArtList();
	
	int insertArtBoard(Board board, ArtBoard artBoard, /*BoardImage boardImg,*/ ArrayList<Option> list);
	
}