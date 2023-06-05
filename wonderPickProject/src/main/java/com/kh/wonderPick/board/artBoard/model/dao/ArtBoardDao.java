
package com.kh.wonderPick.board.artBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.artBoard.model.vo.ArtBoard;
import com.kh.wonderPick.board.boardCommon.model.vo.Board;

@Repository
public class ArtBoardDao {
	
	public ArrayList<ArtBoard> selectArtList(SqlSessionTemplate sqlSession){
		// 페이징처리 해야함. offset도 해야함
		return (ArrayList)sqlSession.selectList("artBoardMapper.selectArtList");
	}
	
	public int enrollBoard(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert(statement, parameter);
	}

	public int enrollArtBoard(SqlSessionTemplate sqlSession, ArtBoard artBoard) {
		return sqlSession.insert(statement, parameter);
	}
	
	public int enrollOption(SqlSessionTemplate sqlSession, Option options) {
		return sqlSession.insert(statement, parameter);;
	}
	
	
	
	

}
