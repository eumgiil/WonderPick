package com.kh.wonderPick.board.contestBoard.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.wonderPick.board.boardCommon.model.vo.Board;
import com.kh.wonderPick.board.boardCommon.model.vo.BoardImage;
import com.kh.wonderPick.board.contestBoard.model.vo.Contest;

@Repository
public class ContestDao {

	public ArrayList<Contest> selectTop10(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectTop10");
	}

	public int insertMainBoard(SqlSessionTemplate sqlSession, Board board) {
		//System.out.println(board);
		return sqlSession.insert("contestBoardMapper.insertMainBoard", board);
		
	}

	public int insertBoardImage(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		
		//System.out.println(boardImage);
		return sqlSession.insert("contestBoardMapper.insertBoardImage", boardImage);
	}

	public int insertEmoticon(SqlSessionTemplate sqlSession, Contest contest) {
		return sqlSession.insert("contestBoardMapper.insertEmoticon");
	}




}
