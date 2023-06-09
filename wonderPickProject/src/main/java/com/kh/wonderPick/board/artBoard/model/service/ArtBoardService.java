package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.common.model.vo.PageInfo;

public interface ArtBoardService {

	int selectArtListCount();
	
	ArrayList<ArtBoardDTO> selectArtList(PageInfo pi);
	
	int insertArtBoard(Board board, ArtBoard artBoard, /*BoardImage boardImg,*/ ArrayList<Option> list);
	
}