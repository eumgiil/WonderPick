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
		return sqlSession.insert("contestBoardMapper.insertMainBoard", board);
	}

	public int insertBoardImage(SqlSessionTemplate sqlSession, BoardImage boardImage) {
		return sqlSession.insert("contestBoardMapper.insertBoardImage", boardImage);
	}

	public int insertPrice(SqlSessionTemplate sqlSession, int price) {
		return sqlSession.insert("contestBoardMapper.insertPrice", price);
	}
	public int insertVote(SqlSessionTemplate sqlSession, Board board) {
		return sqlSession.insert("contestBoardMapper.insertVote", board);
	}

	public ArrayList<Contest> selectVotePage(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectVotePage");
	}

	public ArrayList<Contest> selectMoreList(SqlSessionTemplate sqlSession, Contest contest) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectMoreList", contest);
	}

	public int increaseCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("contestBoardMapper.increaseCount", boardNo);
	}

	public ArrayList<Contest> selectContestDetail(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectContestDetail", boardNo);
	}

	public ArrayList<Contest> selectWinnerList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectWinnerList");
	}

	public ArrayList<Contest> selectVoteLike(SqlSessionTemplate sqlSession, int boardNo) {
		return (ArrayList)sqlSession.selectList("contestBoardMapper.selectVoteLike", boardNo);
	}

	public int updateVoteLike(SqlSessionTemplate sqlSession, Contest contest) {
		return sqlSession.update("contestBoardMapper.updateVoteLike", contest);
	}

	






}
