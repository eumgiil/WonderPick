package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.artBoard.model.dao.ArtBoardDao;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;

@Service
public class ArtBoardServiceImpl implements ArtBoardService {

	@Autowired
	private ArtBoardDao artDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public ArrayList<ArtBoard> selectArtList() {
		return artDao.selectArtList(sqlSession);
	}


//	@Override
//	@Transactional
//	public int enrollArtBoard(Board board, ArtBoard artBoard, Option options) {
//		artDao.insertBoard(sqlSession, board);
//		artDao.insertArtBoard(sqlSession, artBoard);
//		artDao.insertOption(options);
//		
//		return 0;
//	}
	
	

}
