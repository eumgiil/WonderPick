
package com.kh.wonderPick.board.artBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.artBoard.model.vo.DetailOp;
import com.kh.wonderPick.board.artBoard.model.vo.MainOption;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;

@Repository
public class ArtBoardDao {
	
	public ArrayList<ArtBoard> selectArtList(SqlSessionTemplate sqlSession){
		// 페이징처리 해야함. offset도 해야함
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectArtList");
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("artBoardMapper.insertBoard", board);
	}

	public int insertArtBoard(SqlSessionTemplate sqlSession, ArtBoard artBoard) {
		return sqlSession.insert("artBoardMapper.insertArtBoard", artBoard);
	}
	
	public int insertOptions(SqlSessionTemplate sqlSession, String options) {
		return sqlSession.insert("artBoardMapper.insertOptions", options);
	}
	
	public int insertDeList(SqlSessionTemplate sqlSession, String deList) {
		return sqlSession.insert("artBoardMapper.insertDeList", deList);
	}
	
	public int insertPrList(SqlSessionTemplate sqlSession, String prList) {
		return sqlSession.insert("artBoardMapper.insertPrList", prList);
	}
	
	

}
