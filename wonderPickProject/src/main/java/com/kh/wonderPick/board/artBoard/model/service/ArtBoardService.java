package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoardDTO;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.artBoard.model.vo.SearchArt;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.common.model.vo.PageInfo;

public interface ArtBoardService {

	int selectArtListCount(SearchArt searchArt);
	
	ArrayList<ArtBoardDTO> selectArtList(PageInfo pi, SearchArt searchArt);
	
	int insertArtBoard(Board board, ArtBoard artBoard, ArrayList<Option> list, ArrayList<BoardImage> files);
	
	ArtBoard selectArtBoard(int bno);
	
	ArrayList<BoardImage> selectBoardImage(int bno);
	
	ArrayList<Option> selectOptionList(int bno);
	
//	int selectSearchListCount(SearchArt searchArt);
//	
//	ArrayList<ArtBoardDTO> selectSearchList(PageInfo pi, SearchArt searchArt);
	
}