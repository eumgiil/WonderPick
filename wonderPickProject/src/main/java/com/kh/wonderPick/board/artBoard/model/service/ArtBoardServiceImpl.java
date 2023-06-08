package com.kh.wonderPick.board.artBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.wonderPick.board.artBoard.model.dao.ArtBoardDao;
import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOp;
import com.kh.wonderPick.board.artBoard.model.vo.MainOption;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;

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
//	public int insertArtBoard(Board board, ArtBoard artBoard, DetailOp detailOp, MainOption mainOption, BoardImage boardImg) {
//		
//		int result1 = artDao.insertBoard(sqlSession, board);
//		int result2 = artDao.insertArtBoard(sqlSession, artBoard);
//		
//		int result3 = artDao.insertDetailOp(sqlSession, detailOp);
//		int result4 = artDao.insertMainOption(sqlSession, mainOption);
//		
//		int result5 = artDao.insertBoardImg(sqlSession, boardImg);
//		
//		
//		return (result1 * result2 * result3 * result4 * result5);
//	}




	@Override
	@Transactional(
			)
	public int insertArtBoard(Board board, ArtBoard artBoard, /*BoardImage boardImg,*/ ArrayList<DetailOp> list) {
		int result1 = artDao.insertBoard(sqlSession, board);
		int result2 = artDao.insertArtBoard(sqlSession, artBoard);
		int result3 = 1;
		
		for(int i = 0; i < list.size(); i++) {
			result3 = result3 * artDao.insertDeList(sqlSession, list.get(i).getOptions());
		}
		
		
//		int result4 = artDao.insertDetailOp(sqlSession, boardImg);
		return (result1 * result2 * result3);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
