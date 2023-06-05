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

	public void insertMainBoard(SqlSessionTemplate sqlSession, Board b) {
		
		
	}

	public void insertBoardImage(SqlSessionTemplate sqlSession, BoardImage bi) {
		// TODO Auto-generated method stub
		
	}

	public void insertEmoticon(SqlSessionTemplate sqlSession, Contest c) {
		// TODO Auto-generated method stub
		
	}


}
