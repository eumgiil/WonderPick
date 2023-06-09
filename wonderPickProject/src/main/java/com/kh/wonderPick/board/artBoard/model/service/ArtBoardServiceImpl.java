package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.artBoard.model.dao.ArtBoardDao;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.Option;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.common.model.vo.PageInfo;

@Service
public class ArtBoardServiceImpl implements ArtBoardService {

	@Autowired
	private ArtBoardDao artDao;
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	
	
	
	@Override
	public int selectArtListCount() {
		return artDao.selectArtListCount(sqlSession);
	}
	
	@Override
	public ArrayList<ArtBoard> selectArtList(PageInfo pi) {
		return artDao.selectArtList(sqlSession, pi);
	}


	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertArtBoard(Board board, ArtBoard artBoard, /*BoardImage boardImg,*/ ArrayList<Option> list) {
		int result1 = artDao.insertBoard(sqlSession, board);
		int result2 = artDao.insertArtBoard(sqlSession, artBoard);
		int result3 = 1;
		for(int i = 0; i < list.size(); i++) {
			result3 = result3 * artDao.insertOptions(sqlSession, list.get(i));
			
		}
		return (result1 * result2 * result3);
	}


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
