package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOp;
import com.kh.wonderPick.board.artBoard.model.vo.MainOption;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;

public interface ArtBoardService {

	ArrayList<ArtBoard> selectArtList();
	
	int insertArtBoard(Board board, ArtBoard artBoard, /*BoardImage boardImg,*/ ArrayList<DetailOp> list);
	
}